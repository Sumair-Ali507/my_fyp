import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'late_model.dart';
export 'late_model.dart';

class LateWidget extends StatefulWidget {
  const LateWidget({super.key});

  @override
  State<LateWidget> createState() => _LateWidgetState();
}

class _LateWidgetState extends State<LateWidget> {
  late LateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFEF9C3),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            '15 min late',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'georgiz',
                  color: Color(0xFFA16207),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
