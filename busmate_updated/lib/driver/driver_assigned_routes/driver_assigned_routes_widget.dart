import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/assigned_route/assigned_route_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver_assigned_routes_model.dart';
export 'driver_assigned_routes_model.dart';

/// Assigned Rout
class DriverAssignedRoutesWidget extends StatefulWidget {
  const DriverAssignedRoutesWidget({super.key});

  static String routeName = 'driver_assigned_routes';
  static String routePath = '/driverAssignedRoutes';

  @override
  State<DriverAssignedRoutesWidget> createState() =>
      _DriverAssignedRoutesWidgetState();
}

class _DriverAssignedRoutesWidgetState
    extends State<DriverAssignedRoutesWidget> {
  late DriverAssignedRoutesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverAssignedRoutesModel());
  }

  @override
  void dispose() {
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
                  'View Routes',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.assignedRouteModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AssignedRouteWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
