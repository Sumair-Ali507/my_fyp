import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/late/late_widget.dart';
import 'dart:ui';
import 'route_widget.dart' show RouteWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RouteModel extends FlutterFlowModel<RouteWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for late component.
  late LateModel lateModel;

  @override
  void initState(BuildContext context) {
    lateModel = createModel(context, () => LateModel());
  }

  @override
  void dispose() {
    lateModel.dispose();
  }
}
