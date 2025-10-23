import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart' as ff;
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Added for authentication
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Google Maps related variables
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;
  bool _locationServiceEnabled = false;
  PermissionStatus? _permissionGranted;
  // Tracking related variables
  StreamSubscription? _locationSubscription;
  StreamSubscription? _dbSubscription;
  Marker? _trackedMarker;
  String _trackingDeviceId = '';
  bool _isTracking = false;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  // User data
  String _userName = 'Loading...';
  String _busDriverName = 'Loading...';
  String _userRole = 'Loading...';
  double _rating = 0.0;

  // Firestore references
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Added for authentication

  @override
  void initState() {
    super.initState();
    _model = ff.createModel(context, () => HomePageModel());
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Check if Firebase is already initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      // Enable persistence for offline support
      FirebaseDatabase.instance.setPersistenceEnabled(true);

      // Initialize maps and location
      await _initMaps();

      // Fetch user data
      await _fetchUserData();
    } catch (e) {
      print("Error initializing app: $e");
      // Show error to user if needed
    }
  }

  Future<void> _initMaps() async {
    _location = Location();

    // Request location permissions
    await _requestLocationPermission();

    if (_permissionGranted == PermissionStatus.granted) {
      _initLocation();
    } else {
      // Handle case where permission is denied
      print("Location permission denied");
    }
  }

  Future<void> _requestLocationPermission() async {
    // Check if location service is enabled
    _locationServiceEnabled = await _location!.serviceEnabled();
    if (!_locationServiceEnabled) {
      _locationServiceEnabled = await _location!.requestService();
      if (!_locationServiceEnabled) {
        return;
      }
    }

    // Check location permission
    _permissionGranted = await _location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location!.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> _fetchUserData() async {
    try {
      // Get current user ID from Firebase Authentication
      User? user = _auth.currentUser;

      if (user == null) {
        print("No user logged in");
        setState(() {
          _userName = 'Not logged in';
          _busDriverName = 'N/A';
          _userRole = 'Guest';
        });
        return;
      }

      String userId = user.uid;

      // Fetch user data
      DocumentSnapshot userDoc = await _firestore.collection('Users').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          _userName = userDoc.get('name') ?? 'Unknown';
          _userRole = userDoc.get('role') ?? 'User';
          _rating = (userDoc.get('rating') as num?)?.toDouble() ?? 0.0;
        });

        // Fetch bus driver data if user is a passenger
        if (_userRole == 'passenger') {
          QuerySnapshot routesSnapshot = await _firestore.collection('routes')
              .where('passengers', arrayContains: userId)
              .limit(1)
              .get();

          if (routesSnapshot.docs.isNotEmpty) {
            var routeData = routesSnapshot.docs.first.data() as Map<String, dynamic>;
            String driverId = routeData['assignedDriver'] ?? '';

            if (driverId.isNotEmpty) {
              DocumentSnapshot driverDoc = await _firestore.collection('Users').doc(driverId).get();
              if (driverDoc.exists) {
                setState(() {
                  _busDriverName = driverDoc.get('name') ?? 'Unknown Driver';
                });
              }
            }
          } else {
            setState(() {
              _busDriverName = 'No assigned driver';
            });
          }
        } else if (_userRole == 'driver') {
          setState(() {
            _busDriverName = 'Bus Driver';
          });
        }
      } else {
        setState(() {
          _userName = 'User not found';
          _busDriverName = 'N/A';
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        _userName = 'Error loading name';
        _busDriverName = 'Error loading driver';
      });
    }
  }

  _initLocation() {
    // Get initial location
    _location?.getLocation().then((location) {
      if (!_isTracking) {  // Only update current location when not tracking
        setState(() {
          _currentLocation = location;
          _cameraPosition = CameraPosition(
              target: LatLng(_currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0),
              zoom: 15
          );
        });
      }
    }).catchError((error) {
      print("Error getting location: $error");
    });

    // Listen for location changes
    _locationSubscription = _location?.onLocationChanged.listen((newLocation) {
      if (!_isTracking) {  // Only update current location when not tracking
        setState(() {
          _currentLocation = newLocation;
        });
        moveToPosition(LatLng(_currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
      }
    }, onError: (error) {
      print("Location error: $error");
    });
  }

  void _startTracking(String deviceId) {
    if (deviceId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a device ID'))
      );
      return;
    }

    setState(() {
      _trackingDeviceId = deviceId;
      _isTracking = true;
    });

    _dbSubscription = _database.child('user_locations/$deviceId').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null && mounted) {
        final lat = data['latitude'] as double?;
        final lng = data['longitude'] as double?;

        if (lat != null && lng != null) {
          setState(() {
            _trackedMarker = Marker(
              markerId: const MarkerId('tracked_device'),
              position: LatLng(lat, lng),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              infoWindow: const InfoWindow(title: 'Tracked Device'),
            );
          });

          moveToPosition(LatLng(lat, lng));
        }
      }
    }, onError: (error) {
      print("Database error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tracking error: $error'))
      );
      _stopTracking();
    });
  }

  void _stopTracking() {
    _dbSubscription?.cancel();
    setState(() {
      _isTracking = false;
      _trackedMarker = null;
      _trackingDeviceId = '';
    });

    // Resume current location updates when stopping tracking
    if (_currentLocation != null) {
      moveToPosition(LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!));
    }
  }

  moveToPosition(LatLng latLng) async {
    try {
      if (_googleMapController.isCompleted) {
        GoogleMapController mapController = await _googleMapController.future;
        mapController.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: latLng, zoom: 15)
            )
        );
      }
    } catch (e) {
      print("Error moving camera: $e");
    }
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0,3),
                spreadRadius: 4,
                blurRadius: 6
            )
          ]
      ),
      child: ClipOval(
        child: Image.network(
          'https://picsum.photos/seed/260/600',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.person, size: 30);
          },
        ),
      ),
    );
  }

  void _showTrackingDialog() {
    String deviceId = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Track Device'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter Device ID to track',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => deviceId = value,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                _startTracking(deviceId);
              },
              child: const Text('Start Tracking')
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _dbSubscription?.cancel();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  'BusMate',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.margarine(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .fontWeight,
                      fontStyle: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .fontStyle,
                    ),
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: Icon(
                    Icons.notifications_none,
                    color: Color(0xFF4B5563),
                    size: 35.0,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 5.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              'https://picsum.photos/seed/260/600',
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person, size: 50);
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _userName,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      font: GoogleFonts.margarine(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontSize: 18.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    _userRole == 'driver' ? 'Bus Driver' : _busDriverName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'georgiz',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 1.0,
                                      fontSize: 12.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16.0,
                                      ),
                                      Text(
                                        _rating.toStringAsFixed(1),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'georgiz',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Call button pressed ...');
                            },
                            text: '',
                            icon: Icon(
                              Icons.phone,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              width: 50.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              iconAlignment: IconAlignment.start,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'georgiz',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: _cameraPosition ?? CameraPosition(
                            target: LatLng(0, 0),
                            zoom: 15,
                          ),
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
                            if (!_googleMapController.isCompleted) {
                              _googleMapController.complete(controller);
                            }
                          },
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          markers: _trackedMarker != null ? {_trackedMarker!} : {},
                        ),
                        if (_permissionGranted != PermissionStatus.granted)
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              color: Colors.white70,
                              child: Text(
                                'Location permission required',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: _getMarker(),
                          ),
                        ),
                        if (_isTracking)
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Chip(
                              label: Text('Tracking: $_trackingDeviceId'),
                              backgroundColor: Colors.white,
                              deleteIcon: Icon(Icons.close),
                              onDeleted: _stopTracking,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _isTracking ? _stopTracking : _showTrackingDialog,
          child: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
          backgroundColor: _isTracking ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}