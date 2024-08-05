import '/backend/api_requests/api_calls.dart';
import '/components/bookings/invite_members/invite_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'confirm_booking_page_widget.dart' show ConfirmBookingPageWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmBookingPageModel
    extends FlutterFlowModel<ConfirmBookingPageWidget> {
  ///  Local state fields for this page.

  String? disciplineUuid = '';

  String? date = '';

  String? startHour;

  String? finishHour = '';

  bool fieldSelectable = false;

  String? field = '';

  String? disciplineName = '';

  String? disciplineIcon = '';

  String? fieldName = '';

  bool disciplineShowEndHour = true;

  bool loading = false;

  List<dynamic> hourSlots = [];
  void addToHourSlots(dynamic item) => hourSlots.add(item);
  void removeFromHourSlots(dynamic item) => hourSlots.remove(item);
  void removeAtIndexFromHourSlots(int index) => hourSlots.removeAt(index);
  void insertAtIndexInHourSlots(int index, dynamic item) =>
      hourSlots.insert(index, item);
  void updateHourSlotsAtIndex(int index, Function(dynamic) updateFn) =>
      hourSlots[index] = updateFn(hourSlots[index]);

  String? slot = '';

  String? fieldConfig = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Cancel Booking)] action in Button widget.
  ApiCallResponse? cancelBookingOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
