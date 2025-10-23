import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'helpsupport_model.dart';
export 'helpsupport_model.dart';

// Add these imports for Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HelpsupportWidget extends StatefulWidget {
  const HelpsupportWidget({super.key});

  static String routeName = 'helpsupport';
  static String routePath = '/helpsupport';

  @override
  State<HelpsupportWidget> createState() => _HelpsupportWidgetState();
}

class _HelpsupportWidgetState extends State<HelpsupportWidget> {
  late HelpsupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Add Firebase Firestore reference
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpsupportModel());

    _model.textFieldTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Add function to submit feedback to Firebase
  Future<void> _submitFeedback() async {
    if (_model.textFieldTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your feedback before submitting.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Get current timestamp
      final timestamp = DateTime.now();

      // Create feedback data
      Map<String, dynamic> feedbackData = {
        'userId': user?.uid ?? 'anonymous',
        'userEmail': user?.email ?? 'anonymous',
        'feedbackText': _model.textFieldTextController.text,
        'timestamp': timestamp,
        'formattedDate': DateFormat('yyyy-MM-dd – kk:mm').format(timestamp),
      };

      // Add to Firestore collection
      await _firestore.collection('feedback').add(feedbackData);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you for your feedback!'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the text field
      _model.textFieldTextController?.clear();

    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting feedback: $e'),
          backgroundColor: Colors.red,
        ),
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
              'Help & Support',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                font: GoogleFonts.margarine(
                  fontWeight:
                  FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                  fontStyle:
                  FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
                color: Colors.white,
                fontSize: 25.0,
                letterSpacing: 0.0,
                fontWeight:
                FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                fontStyle:
                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFF8F9FA),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x845E5A5A),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Submit Feedback',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                              font: GoogleFonts.margarine(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldTextController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'georgiz',
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Tell us how we can improve...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'georgiz',
                                  letterSpacing: 0.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF9FAFB),
                                hoverColor: Color(0xA657636C),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'georgiz',
                                letterSpacing: 0.0,
                              ),
                              maxLines: 5,
                              cursorColor:
                              FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .textFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          FFButtonWidget(
                            onPressed: () async {
                              // Call the submit feedback function
                              await _submitFeedback();
                            },
                            text: 'Submit Feedback',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'georgiz',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x845E5A5A),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support Hours',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                              font: GoogleFonts.margarine(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Monday - Friday: 8:00 AM - 6:00 PM\nWeekend: 9:00 AM - 3:00 PM',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'georgiz',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryText,
                              letterSpacing: 1.0,
                              lineHeight: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}