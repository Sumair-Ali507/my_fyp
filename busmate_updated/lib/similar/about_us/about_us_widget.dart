import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  static String routeName = 'about_us';
  static String routePath = '/aboutUs';

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());
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
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'About Us',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                font: GoogleFonts.margarine(
                  fontWeight:
                  FlutterFlowTheme.of(context).displaySmall.fontWeight,
                  fontStyle:
                  FlutterFlowTheme.of(context).displaySmall.fontStyle,
                ),
                color: Colors.white,
                fontSize: 25.0,
                letterSpacing: 0.0,
                fontWeight:
                FlutterFlowTheme.of(context).displaySmall.fontWeight,
                fontStyle:
                FlutterFlowTheme.of(context).displaySmall.fontStyle,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0), // Added padding to prevent edge overflow
              decoration: BoxDecoration(
                color: Color(0xFFF8F9FA),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x662D2B2B),
                          offset: Offset(
                            0.0,
                            6.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0), // Added padding
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                        children: [
                          Text(
                            'Welcome to BusMate',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 16.0), // Added spacing
                          Text(
                            'BusMate is dedicated to revolutionizing school transportation by providing a safe, efficient, and reliable bus tracking solution for schools, parents, and students.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              color: Color(0xFF6B7280),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0), // Added spacing
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          offset: Offset(
                            0.0,
                            6.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0), // Added padding
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                        children: [
                          Text(
                            'Our Features',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 16.0), // Added spacing
                          _buildFeatureRow(
                            icon: Icons.location_on,
                            title: 'Real-time Tracking',
                            description: 'Monitor your child\'s school bus location in realtime',
                          ),
                          _buildFeatureRow(
                            icon: Icons.wechat_rounded,
                            title: 'Driver Communication',
                            description: 'Direct messaging with bus drivers for updates',
                          ),
                          _buildFeatureRow(
                            icon: Icons.notifications_active,
                            title: 'Instant Notifications',
                            description: 'Get alerts about delays and schedule changes',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22.0), // Added spacing
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x662D2B2B),
                          offset: Offset(
                            0.0,
                            6.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0), // Added padding
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                        children: [
                          Text(
                            'Our Mission',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 16.0), // Added spacing
                          Text(
                            'To provide peace of mind to parents and schools by ensuring safe and efficient student transportation through innovative technology solutions.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              color: Color(0xFF6B7280),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build feature rows
  Widget _buildFeatureRow({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
          SizedBox(width: 12.0),
          Expanded( // Added Expanded to prevent text overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context)
                      .bodyLarge
                      .override(
                    fontFamily: 'georgiz',
                    letterSpacing: 0.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                    fontFamily: 'georgiz',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}