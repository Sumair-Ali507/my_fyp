import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/route/route_widget.dart';
import 'dart:ui';
import 'routes_view_widget.dart' show RoutesViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoutesViewModel extends FlutterFlowModel<RoutesViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for route component.
  late RouteModel routeModel1;
  // Model for route component.
  late RouteModel routeModel2;
  // Model for route component.
  late RouteModel routeModel3;

  @override
  void initState(BuildContext context) {
    routeModel1 = createModel(context, () => RouteModel());
    routeModel2 = createModel(context, () => RouteModel());
    routeModel3 = createModel(context, () => RouteModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    routeModel1.dispose();
    routeModel2.dispose();
    routeModel3.dispose();
  }
}
