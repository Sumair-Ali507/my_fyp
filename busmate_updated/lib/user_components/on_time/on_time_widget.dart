import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_time_model.dart';
export 'on_time_model.dart';

class OnTimeWidget extends StatefulWidget {
  const OnTimeWidget({super.key});

  @override
  State<OnTimeWidget> createState() => _OnTimeWidgetState();
}

class _OnTimeWidgetState extends State<OnTimeWidget> {
  late OnTimeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnTimeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDCFCE7),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'On Time',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'georgiz',
                  color: Color(0xFF15803D),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
