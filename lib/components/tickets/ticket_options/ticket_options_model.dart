import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'ticket_options_widget.dart' show TicketOptionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TicketOptionsModel extends FlutterFlowModel<TicketOptionsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Cancel Ticket)] action in Button widget.
  ApiCallResponse? cancelOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
