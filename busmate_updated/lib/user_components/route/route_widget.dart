import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/late/late_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'route_model.dart';
export 'route_model.dart';

class RouteWidget extends StatefulWidget {
  const RouteWidget({super.key, required this.routeId});

  final String routeId;

  @override
  State<RouteWidget> createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget> {
  late RouteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('routes')
          .doc(widget.routeId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x64585252),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    spreadRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x64585252),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    spreadRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                child: Center(
                  child: Text('Route not found'),
                ),
              ),
            ),
          );
        }

        // Extract data from the document
        var routeData = snapshot.data!.data() as Map<String, dynamic>;
        String routeName = routeData['routeName'] ?? 'Unnamed Route';
        String routeType = routeData['assignedBus'] ?? 'Unnamed Route';
        String startLocation = routeData['startLocation'] ?? 'Unknown Start';
        String endLocation = routeData['endLocation'] ?? 'Unknown End';
        String startTime = routeData['startTime'] ?? '00:00';
        String endTime = routeData['endTime'] ?? '00:00';

        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x64585252),
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                  spreadRadius: 2.0,
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                routeName,
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
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                              ),
                            ),
                            Text(
                              routeType,
                              style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'georgiz',
                                color: Color(0xFF6B7280),
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                startLocation,
                                style:
                                FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'georgiz',
                                  letterSpacing: 0.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  startTime,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'georgiz',
                                    color: Color(0xFF6B7280),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF6B7280),
                          size: 15.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                endLocation,
                                style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'georgiz',
                                  letterSpacing: 0.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                endTime,
                                style:
                                FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'georgiz',
                                  color: Color(0xFF6B7280),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}