import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'new_ticket_page_widget.dart' show NewTicketPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewTicketPageModel extends FlutterFlowModel<NewTicketPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> files = [];
  void addToFiles(dynamic item) => files.add(item);
  void removeFromFiles(dynamic item) => files.remove(item);
  void removeAtIndexFromFiles(int index) => files.removeAt(index);
  void insertAtIndexInFiles(int index, dynamic item) =>
      files.insert(index, item);
  void updateFilesAtIndex(int index, Function(dynamic) updateFn) =>
      files[index] = updateFn(files[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for subject widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;
  String? Function(BuildContext, String?)? subjectTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Ticket File)] action in Column widget.
  ApiCallResponse? uploadOutput;
  // Stores action output result for [Backend Call - API (Create Ticket)] action in Button widget.
  ApiCallResponse? ticketOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    subjectFocusNode?.dispose();
    subjectTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
