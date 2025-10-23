import 'package:busmate_updated/similar/about_us/about_us_widget.dart';
import 'package:busmate_updated/similar/helpsupport/helpsupport_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_profile_model.dart';
export 'my_profile_model.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});

  static String routeName = 'my_profile';
  static String routePath = '/myProfile';

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  late MyProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Logout function
  Future<void> _signOut(BuildContext context) async {
    try {
      await authManager.signOut();
      // Navigate to login or home page after logout
      context.goNamedAuth('login', context.mounted);
    } catch (e) {
      print('Error signing out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: ${e.toString()}')),
      );
    }
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
                  'Profile',
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
          child: SingleChildScrollView( // Added SingleChildScrollView to fix overflow
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints( // Added constraints to prevent overflow
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xCCFFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 700.0,
                              maxHeight: 750.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    5.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF1F4F8),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Hero(
                                                tag: currentUserPhoto,
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: currentUserPhoto,
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context, error,
                                                        stackTrace) =>
                                                        Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 100.0,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    currentUserDisplayName,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .headlineSmall
                                                        .override(
                                                      font:
                                                      GoogleFonts.outfit(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                      ),
                                                      color:
                                                      Color(0xFF14181B),
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    currentUserEmail,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodySmall
                                                        .override(
                                                      font:
                                                      GoogleFonts.outfit(
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodySmall
                                                            .fontStyle,
                                                      ),
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodySmall
                                                          .fontStyle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0), // Reduced padding
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Settings Button
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 16.0), // Reduced bottom padding
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {


                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFDF0EA),
                                                        borderRadius:
                                                        BorderRadius.circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.settings,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Settings',
                                                          textAlign: TextAlign.start,
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF57636C),
                                                      size: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // About Button
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const AboutUsWidget(),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFDF0EA),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.info,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'About',
                                                          textAlign: TextAlign.start,
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF57636C),
                                                      size: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Contact Us Button
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {

                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFDF0EA),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.headset_mic_rounded,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Contact us',
                                                          textAlign: TextAlign.start,
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF57636C),
                                                      size: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Help & Support Button
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const HelpsupportWidget(),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFDF0EA),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.help,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Help & Support',
                                                          textAlign: TextAlign.start,
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF57636C),
                                                      size: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Logout Button
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                _signOut(context);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFEF2F2),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.logout,
                                                          color: Color(0xFFEF4444),
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Log out',
                                                          textAlign: TextAlign.start,
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            color: Color(0xFFEF4444),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}