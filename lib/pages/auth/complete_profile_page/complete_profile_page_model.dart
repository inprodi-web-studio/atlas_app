import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'complete_profile_page_widget.dart' show CompleteProfilePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CompleteProfilePageModel
    extends FlutterFlowModel<CompleteProfilePageWidget> {
  ///  Local state fields for this page.

  String? gender;

  String? phone = '';

  String? birthdate = '';

  List<String> sports = [];
  void addToSports(String item) => sports.add(item);
  void removeFromSports(String item) => sports.remove(item);
  void removeAtIndexFromSports(int index) => sports.removeAt(index);
  void insertAtIndexInSports(int index, String item) =>
      sports.insert(index, item);
  void updateSportsAtIndex(int index, Function(String) updateFn) =>
      sports[index] = updateFn(sports[index]);

  List<String> hobbies = [];
  void addToHobbies(String item) => hobbies.add(item);
  void removeFromHobbies(String item) => hobbies.remove(item);
  void removeAtIndexFromHobbies(int index) => hobbies.removeAt(index);
  void insertAtIndexInHobbies(int index, String item) =>
      hobbies.insert(index, item);
  void updateHobbiesAtIndex(int index, Function(String) updateFn) =>
      hobbies[index] = updateFn(hobbies[index]);

  String? profession = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '## #### ####');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for SearchDiscipline widget.
  FocusNode? searchDisciplineFocusNode;
  TextEditingController? searchDisciplineTextController;
  String? Function(BuildContext, String?)?
      searchDisciplineTextControllerValidator;
  // State field(s) for SearchHobbies widget.
  FocusNode? searchHobbiesFocusNode;
  TextEditingController? searchHobbiesTextController;
  String? Function(BuildContext, String?)? searchHobbiesTextControllerValidator;
  // State field(s) for SearchProfession widget.
  FocusNode? searchProfessionFocusNode;
  TextEditingController? searchProfessionTextController;
  String? Function(BuildContext, String?)?
      searchProfessionTextControllerValidator;
  // Stores action output result for [Backend Call - API (Complete Profile)] action in Container widget.
  ApiCallResponse? completeProfileOutput;

  /// Query cache managers for this widget.

  final _disciplineManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> discipline({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _disciplineManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDisciplineCache() => _disciplineManager.clear();
  void clearDisciplineCacheKey(String? uniqueKey) =>
      _disciplineManager.clearRequest(uniqueKey);

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

  final _profileManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> profile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _profileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileCache() => _profileManager.clear();
  void clearProfileCacheKey(String? uniqueKey) =>
      _profileManager.clearRequest(uniqueKey);

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
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    searchDisciplineFocusNode?.dispose();
    searchDisciplineTextController?.dispose();

    searchHobbiesFocusNode?.dispose();
    searchHobbiesTextController?.dispose();

    searchProfessionFocusNode?.dispose();
    searchProfessionTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearDisciplineCache();

    clearHobbyCache();

    clearProfileCache();

    clearProfessionsCache();
  }
}
