import '/backend/api_requests/api_calls.dart';
import '/components/global/empty_data/empty_data_widget.dart';
import '/components/tickets/ticket_options/ticket_options_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'support_detail_page_widget.dart' show SupportDetailPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SupportDetailPageModel extends FlutterFlowModel<SupportDetailPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> conversation = [];
  void addToConversation(dynamic item) => conversation.add(item);
  void removeFromConversation(dynamic item) => conversation.remove(item);
  void removeAtIndexFromConversation(int index) => conversation.removeAt(index);
  void insertAtIndexInConversation(int index, dynamic item) =>
      conversation.insert(index, item);
  void updateConversationAtIndex(int index, Function(dynamic) updateFn) =>
      conversation[index] = updateFn(conversation[index]);

  bool loading = true;

  List<dynamic> filesList = [];
  void addToFilesList(dynamic item) => filesList.add(item);
  void removeFromFilesList(dynamic item) => filesList.remove(item);
  void removeAtIndexFromFilesList(int index) => filesList.removeAt(index);
  void insertAtIndexInFilesList(int index, dynamic item) =>
      filesList.insert(index, item);
  void updateFilesListAtIndex(int index, Function(dynamic) updateFn) =>
      filesList[index] = updateFn(filesList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Find One Ticket)] action in SupportDetailPage widget.
  ApiCallResponse? ticketOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send Message)] action in IconButton widget.
  ApiCallResponse? messageOutput;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Ticket File Update)] action in Container widget.
  ApiCallResponse? uploadOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
