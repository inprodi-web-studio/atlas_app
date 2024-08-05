import '/backend/api_requests/api_calls.dart';
import '/components/bookings/invite_members/invite_members_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_detail_model.dart';
export 'booking_detail_model.dart';

class BookingDetailWidget extends StatefulWidget {
  const BookingDetailWidget({
    super.key,
    required this.bookingUuid,
  });

  final String? bookingUuid;

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  late BookingDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingDetailModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: BookingsGroup.findOneBookingCall.call(
        bookingUuid: widget!.bookingUuid,
        token: FFAppState().token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingCube(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final containerFindOneBookingResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: BarcodeWidget(
                                data: BookingsGroup.findOneBookingCall.uuid(
                                  containerFindOneBookingResponse.jsonBody,
                                )!,
                                barcode: Barcode.qrCode(),
                                width: 150.0,
                                height: 150.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                                backgroundColor: Colors.transparent,
                                errorBuilder: (_context, _error) => SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                ),
                                drawText: false,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    functions.dateToHumanDate(
                                        BookingsGroup.findOneBookingCall.date(
                                      containerFindOneBookingResponse.jsonBody,
                                    )!),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Fecha',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${BookingsGroup.findOneBookingCall.startHour(
                                      containerFindOneBookingResponse.jsonBody,
                                    )}${() {
                                      if ((getJsonField(
                                                containerFindOneBookingResponse
                                                    .jsonBody,
                                                r'''$.field''',
                                              ) !=
                                              null) &&
                                          getJsonField(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                            r'''$.field.discipline.bookingConfig.showEndHour''',
                                          )) {
                                        return ' - ';
                                      } else if ((getJsonField(
                                                containerFindOneBookingResponse
                                                    .jsonBody,
                                                r'''$.discipline''',
                                              ) !=
                                              null) &&
                                          getJsonField(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                            r'''$.discipline.bookingConfig.showEndHour''',
                                          )) {
                                        return ' - ';
                                      } else {
                                        return '';
                                      }
                                    }()}${() {
                                      if ((getJsonField(
                                                containerFindOneBookingResponse
                                                    .jsonBody,
                                                r'''$.field''',
                                              ) !=
                                              null) &&
                                          getJsonField(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                            r'''$.field.discipline.bookingConfig.showEndHour''',
                                          )) {
                                        return getJsonField(
                                          containerFindOneBookingResponse
                                              .jsonBody,
                                          r'''$.finishHour''',
                                        ).toString();
                                      } else if ((getJsonField(
                                                containerFindOneBookingResponse
                                                    .jsonBody,
                                                r'''$.discipline''',
                                              ) !=
                                              null) &&
                                          getJsonField(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                            r'''$.discipline.bookingConfig.showEndHour''',
                                          )) {
                                        return getJsonField(
                                          containerFindOneBookingResponse
                                              .jsonBody,
                                          r'''$.finishHour''',
                                        ).toString();
                                      } else {
                                        return '';
                                      }
                                    }()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Hora',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    BookingsGroup.findOneBookingCall.fieldName(
                                              containerFindOneBookingResponse
                                                  .jsonBody,
                                            ) !=
                                            null
                                        ? getJsonField(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                            r'''$.field.discipline.name''',
                                          ).toString()
                                        : BookingsGroup.findOneBookingCall
                                            .disciplineName(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                          )!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Disciplina',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                              if (BookingsGroup.findOneBookingCall.fieldName(
                                    containerFindOneBookingResponse.jsonBody,
                                  ) !=
                                  null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      BookingsGroup.findOneBookingCall
                                          .fieldName(
                                            containerFindOneBookingResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    Text(
                                      'Cancha',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Presenta el QR en tu cancha para hacer Check-In. Recuerda presentarte a tiempo para evitar penalizaciones.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 14.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x40000000),
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: InviteMembersWidget(
                                            bookingUuid: BookingsGroup
                                                .findOneBookingCall
                                                .uuid(
                                              containerFindOneBookingResponse
                                                  .jsonBody,
                                            )!,
                                            capacity: valueOrDefault<int>(
                                              getJsonField(
                                                        containerFindOneBookingResponse
                                                            .jsonBody,
                                                        r'''$.discipline.bookingConfig.maxPeople''',
                                                      ) !=
                                                      null
                                                  ? getJsonField(
                                                      containerFindOneBookingResponse
                                                          .jsonBody,
                                                      r'''$.discipline.bookingConfig.maxPeople''',
                                                    )
                                                  : getJsonField(
                                                      containerFindOneBookingResponse
                                                          .jsonBody,
                                                      r'''$.field.discipline.bookingConfig.maxPeople''',
                                                    ),
                                              0,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Invitar Personas',
                                icon: Icon(
                                  Icons.person_add,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 52.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Cancelando la reservación...',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 11.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  );
                                  _model.cancelBookingOutput =
                                      await BookingsGroup.cancelBookingCall
                                          .call(
                                    token: FFAppState().token,
                                    bookingUuid: widget!.bookingUuid,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.cancelBookingOutput?.succeeded ??
                                      true)) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Se ha cancelado correctamente tu reservación',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Hubo un error para cancelar tu reservación',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Cancelar Reservación',
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 52.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ].divide(SizedBox(height: 30.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
