import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/assigned_route/assigned_route_widget.dart';
import 'dart:ui';
import 'driver_assigned_routes_widget.dart' show DriverAssignedRoutesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverAssignedRoutesModel
    extends FlutterFlowModel<DriverAssignedRoutesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for assigned_route component.
  late AssignedRouteModel assignedRouteModel;

  @override
  void initState(BuildContext context) {
    assignedRouteModel = createModel(context, () => AssignedRouteModel());
  }

  @override
  void dispose() {
    assignedRouteModel.dispose();
  }
}
