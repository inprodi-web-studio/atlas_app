import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'event_detail_page_model.dart';
export 'event_detail_page_model.dart';

class EventDetailPageWidget extends StatefulWidget {
  const EventDetailPageWidget({
    super.key,
    required this.uuid,
  });

  final String? uuid;

  @override
  State<EventDetailPageWidget> createState() => _EventDetailPageWidgetState();
}

class _EventDetailPageWidgetState extends State<EventDetailPageWidget> {
  late EventDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: EventsGroup.findOneEventCall.call(
        eventUuid: widget!.uuid,
        token: FFAppState().token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final eventDetailPageFindOneEventResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            floatingActionButton: Visibility(
              visible: EventsGroup.findOneEventCall.capacity(
                    eventDetailPageFindOneEventResponse.jsonBody,
                  ) !=
                  null,
              child: FloatingActionButton.extended(
                onPressed: () {
                  print('FloatingActionButton pressed ...');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 0.0,
                label: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    _model.bookOutput = await EventsGroup.bookEventCall.call(
                      token: FFAppState().token,
                      uuid: widget!.uuid,
                    );

                    _shouldSetState = true;
                    if ((_model.bookOutput?.succeeded ?? true)) {
                      if (getJsonField(
                        (_model.bookOutput?.jsonBody ?? ''),
                        r'''$.isBooked''',
                      )) {
                        _model.bookingState = true;
                        setState(() {});
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Tu reservación se hizo correctamente',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 11.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );
                      } else {
                        _model.bookingState = false;
                        setState(() {});
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Se ha liberado tu lugar correctamente',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 11.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).warning,
                          ),
                        );
                      }

                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Ha ocurrido un error de servidor.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 11.0,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: () {
                    if ((_model.bookingState == true) &&
                        (_model.bookingState != null)) {
                      return 'Quitar Reserva';
                    } else if ((_model.bookingState == false) &&
                        (_model.bookingState != null)) {
                      return 'Reservar Lugar';
                    } else if (getJsonField(
                      eventDetailPageFindOneEventResponse.jsonBody,
                      r'''$.isBooked''',
                    )) {
                      return 'Quitar Reserva';
                    } else {
                      return 'Reservar Lugar';
                    }
                  }(),
                  options: FFButtonOptions(
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Gotham',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.0,
                    child: Stack(
                      children: [
                        if (getJsonField(
                              eventDetailPageFindOneEventResponse.jsonBody,
                              r'''$.image.url''',
                            ) !=
                            null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              '${FFAppConstants.apiUrl}/public${getJsonField(
                                eventDetailPageFindOneEventResponse.jsonBody,
                                r'''$.image.url''',
                              ).toString()}',
                              width: double.infinity,
                              height: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (getJsonField(
                              eventDetailPageFindOneEventResponse.jsonBody,
                              r'''$.image.url''',
                            ) ==
                            null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/splash_screen.jpg',
                              width: double.infinity,
                              height: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x00FFFFFF), Colors.white],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 50.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, -35.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        EventsGroup.findOneEventCall.name(
                                          eventDetailPageFindOneEventResponse
                                              .jsonBody,
                                        ),
                                        'Título',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        EventsGroup.findOneEventCall.place(
                                          eventDetailPageFindOneEventResponse
                                              .jsonBody,
                                        ),
                                        'Place',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 4.0, 10.0, 4.0),
                                  child: Text(
                                    (EventsGroup.findOneEventCall.cost(
                                                  eventDetailPageFindOneEventResponse
                                                      .jsonBody,
                                                ) ==
                                                0) ||
                                            (EventsGroup.findOneEventCall.cost(
                                                  eventDetailPageFindOneEventResponse
                                                      .jsonBody,
                                                ) ==
                                                null)
                                        ? 'GRATUITO'
                                        : '\$${EventsGroup.findOneEventCall.cost(
                                              eventDetailPageFindOneEventResponse
                                                  .jsonBody,
                                            )?.toString()} MXN',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${functions.dateToHumanDateNoYear(EventsGroup.findOneEventCall.startDate(
                                      eventDetailPageFindOneEventResponse
                                          .jsonBody,
                                    )!)}, ${EventsGroup.findOneEventCall.startHour(
                                      eventDetailPageFindOneEventResponse
                                          .jsonBody,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Inicio',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${functions.dateToHumanDateNoYear(EventsGroup.findOneEventCall.finishDate(
                                      eventDetailPageFindOneEventResponse
                                          .jsonBody,
                                    )!)}, ${EventsGroup.findOneEventCall.finishHour(
                                      eventDetailPageFindOneEventResponse
                                          .jsonBody,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    'Fin',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ),
                        if (EventsGroup.findOneEventCall.capacity(
                              eventDetailPageFindOneEventResponse.jsonBody,
                            ) !=
                            null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                LinearPercentIndicator(
                                  percent: valueOrDefault<double>(
                                    EventsGroup.findOneEventCall
                                            .assistants(
                                              eventDetailPageFindOneEventResponse
                                                  .jsonBody,
                                            )!
                                            .length /
                                        (EventsGroup.findOneEventCall.capacity(
                                          eventDetailPageFindOneEventResponse
                                              .jsonBody,
                                        )!),
                                    0.0,
                                  ),
                                  lineHeight: 12.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primary,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  barRadius: Radius.circular(20.0),
                                  padding: EdgeInsets.zero,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Aforo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Text(
                                      '${EventsGroup.findOneEventCall.assistants(
                                            eventDetailPageFindOneEventResponse
                                                .jsonBody,
                                          )?.length?.toString()} / ${EventsGroup.findOneEventCall.capacity(
                                            eventDetailPageFindOneEventResponse
                                                .jsonBody,
                                          )?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Descripción',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  EventsGroup.findOneEventCall.description(
                                    eventDetailPageFindOneEventResponse
                                        .jsonBody,
                                  ),
                                  'Título',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
