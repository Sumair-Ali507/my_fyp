import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver_homepage_model.dart';
export 'driver_homepage_model.dart';

class DriverHomepageWidget extends StatefulWidget {
  const DriverHomepageWidget({super.key});

  static String routeName = 'driver_homepage';
  static String routePath = '/driverHomepage';

  @override
  State<DriverHomepageWidget> createState() => _DriverHomepageWidgetState();
}

class _DriverHomepageWidgetState extends State<DriverHomepageWidget> {
  late DriverHomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverHomepageModel());
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0xC7FEB269),
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                        spreadRadius: 6.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Start Route',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 200.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.margarine(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        shadows: [
                          Shadow(
                            color: Color(0xC36B7280),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 2.0,
                          )
                        ],
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Color(0xD6FEB269),
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      hoverColor: FlutterFlowTheme.of(context).secondary,
                      hoverBorderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                      hoverTextColor: Color(0xFFDCFCE7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
