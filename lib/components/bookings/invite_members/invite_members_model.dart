import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'invite_members_widget.dart' show InviteMembersWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InviteMembersModel extends FlutterFlowModel<InviteMembersWidget> {
  ///  Local state fields for this component.

  List<String> emails = [];
  void addToEmails(String item) => emails.add(item);
  void removeFromEmails(String item) => emails.remove(item);
  void removeAtIndexFromEmails(int index) => emails.removeAt(index);
  void insertAtIndexInEmails(int index, String item) =>
      emails.insert(index, item);
  void updateEmailsAtIndex(int index, Function(String) updateFn) =>
      emails[index] = updateFn(emails[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ma widget.
  FocusNode? maFocusNode;
  TextEditingController? maTextController;
  String? Function(BuildContext, String?)? maTextControllerValidator;
  String? _maTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa un correo electrónico';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresa un correo electrónico';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Invite Attendants)] action in Button widget.
  ApiCallResponse? inviteOutput;

  @override
  void initState(BuildContext context) {
    maTextControllerValidator = _maTextControllerValidator;
  }

  @override
  void dispose() {
    maFocusNode?.dispose();
    maTextController?.dispose();
  }
}
