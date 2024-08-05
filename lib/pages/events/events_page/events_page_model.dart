import '/backend/api_requests/api_calls.dart';
import '/components/global/empty_data/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'events_page_widget.dart' show EventsPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EventsPageModel extends FlutterFlowModel<EventsPageWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  List<dynamic> eventsData = [];
  void addToEventsData(dynamic item) => eventsData.add(item);
  void removeFromEventsData(dynamic item) => eventsData.remove(item);
  void removeAtIndexFromEventsData(int index) => eventsData.removeAt(index);
  void insertAtIndexInEventsData(int index, dynamic item) =>
      eventsData.insert(index, item);
  void updateEventsDataAtIndex(int index, Function(dynamic) updateFn) =>
      eventsData[index] = updateFn(eventsData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Find Many Events)] action in EventsPage widget.
  ApiCallResponse? eventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
