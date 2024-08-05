import '/backend/api_requests/api_calls.dart';
import '/components/bookings/booking_detail/booking_detail_widget.dart';
import '/components/bookings/next_bookings_empty/next_bookings_empty_widget.dart';
import '/components/global/drawer_section/drawer_section_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Member Profile)] action in HomePage widget.
  ApiCallResponse? checkerOutput;
  // Model for DrawerSection component.
  late DrawerSectionModel drawerSectionModel;

  @override
  void initState(BuildContext context) {
    drawerSectionModel = createModel(context, () => DrawerSectionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerSectionModel.dispose();
  }
}
