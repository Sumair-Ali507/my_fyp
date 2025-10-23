import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/route/route_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'routes_view_model.dart';
export 'routes_view_model.dart';

class RoutesViewWidget extends StatefulWidget {
  const RoutesViewWidget({super.key});

  static String routeName = 'routes_view';
  static String routePath = '/routesView';

  @override
  State<RoutesViewWidget> createState() => _RoutesViewWidgetState();
}

class _RoutesViewWidgetState extends State<RoutesViewWidget> {
  late RoutesViewModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<DocumentSnapshot> _allRoutes = [];
  List<DocumentSnapshot> _filteredRoutes = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoutesViewModel());
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textController?.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _model.textController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredRoutes = List.from(_allRoutes);
      } else {
        _filteredRoutes = _allRoutes.where((route) {
          final name = route['name']?.toString().toLowerCase() ?? '';
          final startLocation = route['startLocation']?.toString().toLowerCase() ?? '';
          final endLocation = route['endLocation']?.toString().toLowerCase() ?? '';
          return name.contains(query) ||
              startLocation.contains(query) ||
              endLocation.contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _model.textController?.removeListener(_onSearchChanged);
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
                  'Routes',
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
                    fontWeight: FlutterFlowTheme.of(context)
                        .headlineLarge
                        .fontWeight,
                    fontStyle: FlutterFlowTheme.of(context)
                        .headlineLarge
                        .fontStyle,
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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('routes').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No routes found'));
              }

              // Update the routes lists
              _allRoutes.clear();
              _allRoutes.addAll(snapshot.data!.docs);

              // Apply search filter if needed
              if (_filteredRoutes.isEmpty || _model.textController!.text.isEmpty) {
                _filteredRoutes = List.from(_allRoutes);
              } else {
                _onSearchChanged(); // Reapply filter with current data
              }

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'georgiz',
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            hintText: 'Search routes...',
                            hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'georgiz',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'georgiz',
                            color: Color(0xFF485A67),
                            letterSpacing: 0.0,
                          ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator:
                          _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _filteredRoutes.length,
                      itemBuilder: (context, index) {
                        final route = _filteredRoutes[index];
                        return wrapWithModel(
                          model: _model,
                          updateCallback: () => safeSetState(() {}),
                          child: RouteWidget(routeId: route.id),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}