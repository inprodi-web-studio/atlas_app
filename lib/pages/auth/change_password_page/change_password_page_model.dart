import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa tu contraseña';
    }

    return null;
  }

  // State field(s) for Co widget.
  FocusNode? coFocusNode;
  TextEditingController? coTextController;
  late bool coVisibility;
  String? Function(BuildContext, String?)? coTextControllerValidator;
  String? _coTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirma tu contraseña';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Reset Password)] action in Button widget.
  ApiCallResponse? resetPasswordOutput;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    coVisibility = false;
    coTextControllerValidator = _coTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    coFocusNode?.dispose();
    coTextController?.dispose();
  }
}
