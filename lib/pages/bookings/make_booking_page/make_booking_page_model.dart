import '/backend/api_requests/api_calls.dart';
import '/components/bookings/no_slots_empty/no_slots_empty_widget.dart';
import '/components/global/empty_data/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'make_booking_page_widget.dart' show MakeBookingPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MakeBookingPageModel extends FlutterFlowModel<MakeBookingPageWidget> {
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
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Get Day Slots NO FIELD)] action in Container widget.
  ApiCallResponse? slotsOutput;
  // Stores action output result for [Backend Call - API (Get Day Slots FIELD)] action in Container widget.
  ApiCallResponse? slotsOutput4;
  // Stores action output result for [Custom Action - getCalendarSelection] action in No widget.
  String? calendarSelectionOutput;
  // Stores action output result for [Backend Call - API (Get Day Slots NO FIELD)] action in No widget.
  ApiCallResponse? slotsOutput2;
  // Stores action output result for [Custom Action - getCalendarSelection] action in Yes widget.
  String? calendarSelectionOutput2;
  // Stores action output result for [Backend Call - API (Get Day Slots FIELD)] action in Yes widget.
  ApiCallResponse? slotsOutput3;
  // Stores action output result for [Backend Call - API (Create No Field Booking)] action in Button widget.
  ApiCallResponse? noFieldOutput;
  // Stores action output result for [Backend Call - API (Create Random Field Booking)] action in Button widget.
  ApiCallResponse? randomFieldOutput;
  // Stores action output result for [Backend Call - API (Create Field Booking)] action in Button widget.
  ApiCallResponse? userFieldOutput;

  /// Query cache managers for this widget.

  final _disciplinesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> disciplines({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _disciplinesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDisciplinesCache() => _disciplinesManager.clear();
  void clearDisciplinesCacheKey(String? uniqueKey) =>
      _disciplinesManager.clearRequest(uniqueKey);

  final _fieldsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fields({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fieldsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFieldsCache() => _fieldsManager.clear();
  void clearFieldsCacheKey(String? uniqueKey) =>
      _fieldsManager.clearRequest(uniqueKey);

  final _calendarInfoManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> calendarInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _calendarInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCalendarInfoCache() => _calendarInfoManager.clear();
  void clearCalendarInfoCacheKey(String? uniqueKey) =>
      _calendarInfoManager.clearRequest(uniqueKey);

  final _calendarInfoFieldsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> calendarInfoFields({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _calendarInfoFieldsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCalendarInfoFieldsCache() => _calendarInfoFieldsManager.clear();
  void clearCalendarInfoFieldsCacheKey(String? uniqueKey) =>
      _calendarInfoFieldsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearDisciplinesCache();

    clearFieldsCache();

    clearCalendarInfoCache();

    clearCalendarInfoFieldsCache();
  }
}
