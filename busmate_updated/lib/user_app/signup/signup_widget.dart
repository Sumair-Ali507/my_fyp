import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_model.dart';
export 'signup_model.dart';

// Firestore import
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  static String routeName = 'signup';
  static String routePath = '/signup';

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.cmsIdTextController ??= TextEditingController();
    _model.cmsIdFocusNode ??= FocusNode();

    _model.homeAddressTextController ??= TextEditingController();
    _model.homeAddressFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Function to save user data to Firestore
  Future<void> _saveUserDataToFirestore(String? userId) async {
    try {
      await _firestore.collection('Users').doc(userId).set({
        'uid': userId,
        'name': _model.nameTextController.text.trim(),
        'cmsId': _model.cmsIdTextController.text.trim(),
        'homeAddress': _model.homeAddressTextController.text.trim(),
        'email': _model.emailAddressTextController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'userType': 'student', // You can modify this based on your app's requirements
        'isActive': true,
      });
    } catch (e) {
      print('Error saving user data: $e');
      throw e; // Re-throw to handle in the calling function
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
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'BusMate',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                font: GoogleFonts.margarine(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontStyle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      'Sign up',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                        font: GoogleFonts.margarine(
                                          fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .fontWeight,
                                          fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.nameTextController,
                                        focusNode: _model.nameFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.name],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Your Name',
                                          labelStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'georgiz',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'georgiz',
                                          letterSpacing: 0.0,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.cmsIdTextController,
                                        focusNode: _model.cmsIdFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.username],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'CMS ID',
                                          labelStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'georgiz',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'georgiz',
                                          letterSpacing: 0.0,
                                        ),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your CMS ID';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                        _model.homeAddressTextController,
                                        focusNode: _model.homeAddressFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.fullStreetAddress],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Home Address',
                                          labelStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'georgiz',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'georgiz',
                                          letterSpacing: 0.0,
                                        ),
                                        keyboardType: TextInputType.streetAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your home address';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                        _model.emailAddressTextController,
                                        focusNode: _model.emailAddressFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'georgiz',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'georgiz',
                                          letterSpacing: 0.0,
                                        ),
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                              .hasMatch(value)) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                        _model.passwordTextController,
                                        focusNode: _model.passwordFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                            fontFamily: 'georgiz',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () => safeSetState(
                                                  () => _model.passwordVisibility =
                                              !_model.passwordVisibility,
                                            ),
                                            focusNode:
                                            FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                  .visibility_off_outlined,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'georgiz',
                                          letterSpacing: 0.0,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          if (value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        // Validate all form fields
                                        if (_model.nameTextController.text.isEmpty ||
                                            _model.cmsIdTextController.text.isEmpty ||
                                            _model.homeAddressTextController.text.isEmpty ||
                                            _model.emailAddressTextController.text.isEmpty ||
                                            _model.passwordTextController.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Please fill in all fields')),
                                          );
                                          return;
                                        }

                                        // Show loading indicator
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          },
                                        );

                                        try {
                                          GoRouter.of(context).prepareAuthEvent();

                                          final user = await authManager.createAccountWithEmail(
                                            context,
                                            _model.emailAddressTextController.text,
                                            _model.passwordTextController.text,
                                          );

                                          if (user != null) {
                                            // Save user data to Firestore
                                            await _saveUserDataToFirestore(user.uid);

                                            // Dismiss loading indicator
                                            Navigator.of(context).pop();

                                            // Navigate to home page
                                            context.goNamedAuth(
                                              HomePageWidget.routeName,
                                              context.mounted,
                                            );
                                          } else {
                                            // Dismiss loading indicator
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Failed to create account')),
                                            );
                                          }
                                        } catch (e) {
                                          // Dismiss loading indicator
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Error creating account: ${e.toString()}')),
                                          );
                                        }
                                      },
                                      text: 'Sign up',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'georgiz',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: Stack(
                                        alignment:
                                        AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 2.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 70.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'OR',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                  fontFamily: 'georgiz',
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user = await authManager
                                            .signInWithGoogle(context);
                                        if (user == null) {
                                          return;
                                        }

                                        context.goNamedAuth(
                                            HomePageWidget.routeName,
                                            context.mounted);
                                      },
                                      text: 'Continue with Google',
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'georgiz',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                  ),

                                  // Login redirect
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigate to login page
                                          context.pushNamed('login'); // Make sure you have a login route named 'login'
                                        },
                                        child: RichText(
                                          textScaler:
                                          MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'already have an account? ',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'georgiz',
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'login here',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'georgiz',
                                                  color: Color(0xFF007BFF),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}