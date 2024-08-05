import '/backend/api_requests/api_calls.dart';
import '/components/global/club_selector/club_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drawer_section_widget.dart' show DrawerSectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerSectionModel extends FlutterFlowModel<DrawerSectionWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for clubSelector component.
  late ClubSelectorModel clubSelectorModel;

  @override
  void initState(BuildContext context) {
    clubSelectorModel = createModel(context, () => ClubSelectorModel());
  }

  @override
  void dispose() {
    clubSelectorModel.dispose();
  }
}
