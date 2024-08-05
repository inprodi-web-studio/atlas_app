import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'my_preferences_page_widget.dart' show MyPreferencesPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPreferencesPageModel extends FlutterFlowModel<MyPreferencesPageWidget> {
  ///  Local state fields for this page.

  List<String> sport = [''];
  void addToSport(String item) => sport.add(item);
  void removeFromSport(String item) => sport.remove(item);
  void removeAtIndexFromSport(int index) => sport.removeAt(index);
  void insertAtIndexInSport(int index, String item) =>
      sport.insert(index, item);
  void updateSportAtIndex(int index, Function(String) updateFn) =>
      sport[index] = updateFn(sport[index]);

  List<String> hobbies = [''];
  void addToHobbies(String item) => hobbies.add(item);
  void removeFromHobbies(String item) => hobbies.remove(item);
  void removeAtIndexFromHobbies(int index) => hobbies.removeAt(index);
  void insertAtIndexInHobbies(int index, String item) =>
      hobbies.insert(index, item);
  void updateHobbiesAtIndex(int index, Function(String) updateFn) =>
      hobbies[index] = updateFn(hobbies[index]);

  String profession = '';

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Member Profile)] action in MyPreferencesPage widget.
  ApiCallResponse? profileOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (Update Metas )] action in Button widget.
  ApiCallResponse? sportsOutput;
  // Stores action output result for [Backend Call - API (Update Metas )] action in Button widget.
  ApiCallResponse? disciplineOutput;
  // Stores action output result for [Backend Call - API (Update Metas PROFESSION)] action in Button widget.
  ApiCallResponse? professionOutput;

  /// Query cache managers for this widget.

  final _sportsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> sports({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _sportsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSportsCache() => _sportsManager.clear();
  void clearSportsCacheKey(String? uniqueKey) =>
      _sportsManager.clearRequest(uniqueKey);

  final _hobbyManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> hobby({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _hobbyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHobbyCache() => _hobbyManager.clear();
  void clearHobbyCacheKey(String? uniqueKey) =>
      _hobbyManager.clearRequest(uniqueKey);

  final _professionsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> professions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _professionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfessionsCache() => _professionsManager.clear();
  void clearProfessionsCacheKey(String? uniqueKey) =>
      _professionsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearSportsCache();

    clearHobbyCache();

    clearProfessionsCache();
  }
}
