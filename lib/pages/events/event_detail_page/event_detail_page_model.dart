import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'event_detail_page_widget.dart' show EventDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class EventDetailPageModel extends FlutterFlowModel<EventDetailPageWidget> {
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

  bool? bookingState;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Book Event)] action in Button widget.
  ApiCallResponse? bookOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
