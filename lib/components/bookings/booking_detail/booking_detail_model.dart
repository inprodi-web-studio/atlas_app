import '/backend/api_requests/api_calls.dart';
import '/components/bookings/invite_members/invite_members_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'booking_detail_widget.dart' show BookingDetailWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingDetailModel extends FlutterFlowModel<BookingDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Cancel Booking)] action in Button widget.
  ApiCallResponse? cancelBookingOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
