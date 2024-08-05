import '/backend/api_requests/api_calls.dart';
import '/components/bookings/no_slots_empty/no_slots_empty_widget.dart';
import '/components/global/empty_data/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'make_booking_page_model.dart';
export 'make_booking_page_model.dart';

class MakeBookingPageWidget extends StatefulWidget {
  const MakeBookingPageWidget({super.key});

  @override
  State<MakeBookingPageWidget> createState() => _MakeBookingPageWidgetState();
}

class _MakeBookingPageWidgetState extends State<MakeBookingPageWidget> {
  late MakeBookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakeBookingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.date = valueOrDefault<String>(
        dateTimeFormat(
          'yyyy-MM-dd',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        'no value',
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: _model.pageViewCurrentIndex != 0,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 30.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).atlasBlack,
                size: 24.0,
              ),
              onPressed: () async {
                if ((_model.pageViewCurrentIndex == 2) &&
                    !_model.fieldSelectable) {
                  await _model.pageViewController?.animateToPage(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  await _model.pageViewController?.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          title: Text(
            () {
              if (_model.pageViewCurrentIndex == 0) {
                return 'Disciplina';
              } else if (_model.pageViewCurrentIndex == 1) {
                return 'Cancha';
              } else if (_model.pageViewCurrentIndex == 2) {
                return 'Fecha';
              } else if (_model.pageViewCurrentIndex == 3) {
                return 'Confirmación';
              } else {
                return 'Reservación';
              }
            }(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Gotham',
                  color: FlutterFlowTheme.of(context).atlasBlack,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 30.0,
                icon: Icon(
                  Icons.close_sharp,
                  color: FlutterFlowTheme.of(context).atlasBlack,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'BookingsPage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.topToBottom,
                      ),
                    },
                  );
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) => setState(() {}),
                        scrollDirection: Axis.horizontal,
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: _model.disciplines(
                              requestFn: () =>
                                  DisciplinesGroup.findManyDisciplinesCall.call(
                                token: FFAppState().token,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final gridViewFindManyDisciplinesResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final disciplines = getJsonField(
                                    gridViewFindManyDisciplinesResponse
                                        .jsonBody,
                                    r'''$.data''',
                                  ).toList();

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.85,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: disciplines.length,
                                    itemBuilder: (context, disciplinesIndex) {
                                      final disciplinesItem =
                                          disciplines[disciplinesIndex];
                                      return Opacity(
                                        opacity: getJsonField(
                                          disciplinesItem,
                                          r'''$.penalized''',
                                        )
                                            ? 0.5
                                            : 1.0,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (getJsonField(
                                              disciplinesItem,
                                              r'''$.penalized''',
                                            )) {
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Tienes una penalización activa en esta disciplina',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .warning,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              _model.disciplineUuid =
                                                  getJsonField(
                                                disciplinesItem,
                                                r'''$.uuid''',
                                              ).toString();
                                              _model.fieldSelectable =
                                                  functions.setFieldSelectable(
                                                      getJsonField(
                                                disciplinesItem,
                                                r'''$.fieldConfig.fieldAssociation''',
                                              ).toString());
                                              _model.disciplineName =
                                                  getJsonField(
                                                disciplinesItem,
                                                r'''$.name''',
                                              ).toString();
                                              _model.disciplineIcon =
                                                  getJsonField(
                                                disciplinesItem,
                                                r'''$.iconURL''',
                                              ).toString();
                                              _model.disciplineShowEndHour =
                                                  getJsonField(
                                                disciplinesItem,
                                                r'''$.bookingConfig.showEndHour''',
                                              );
                                              _model.loading = true;
                                              _model.date = dateTimeFormat(
                                                'yyyy-MM-dd',
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                              _model.startHour = null;
                                              _model.finishHour = '';
                                              _model.field = '';
                                              _model.fieldName = '';
                                              _model.hourSlots = [];
                                              _model.slot = '';
                                              _model.fieldConfig = getJsonField(
                                                disciplinesItem,
                                                r'''$.fieldConfig.fieldAssociation''',
                                              ).toString();
                                              setState(() {});
                                              _model.clearFieldsCache();
                                              _model.clearCalendarInfoCache();
                                              if (functions.setFieldSelectable(
                                                  getJsonField(
                                                disciplinesItem,
                                                r'''$.fieldConfig.fieldAssociation''',
                                              ).toString())) {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              _model.slotsOutput =
                                                  await BookingsGroup
                                                      .getDaySlotsNOFIELDCall
                                                      .call(
                                                day: _model.date,
                                                discipline:
                                                    _model.disciplineUuid,
                                                token: FFAppState().token,
                                              );

                                              _shouldSetState = true;
                                              if ((_model
                                                      .slotsOutput?.succeeded ??
                                                  true)) {
                                                _model.loading = false;
                                                _model.hourSlots = (_model
                                                            .slotsOutput
                                                            ?.jsonBody ??
                                                        '')
                                                    .toList()
                                                    .cast<dynamic>();
                                                setState(() {});
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Ocurrió un error de servidor',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 11.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.disciplineUuid ==
                                                        getJsonField(
                                                          disciplinesItem,
                                                          r'''$.uuid''',
                                                        ).toString()
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .atlasPrimary10
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .atlasGray10,
                                                FlutterFlowTheme.of(context)
                                                    .atlasGray10,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  _model.disciplineUuid ==
                                                          getJsonField(
                                                            disciplinesItem,
                                                            r'''$.uuid''',
                                                          ).toString()
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .atlasGray10,
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray10,
                                                ),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.disciplineUuid ==
                                                                getJsonField(
                                                                  disciplinesItem,
                                                                  r'''$.uuid''',
                                                                ).toString()
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasPrimary25
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                                    disciplinesItem,
                                                                    r'''$.iconURL''',
                                                                  ) !=
                                                                  null
                                                              ? '${FFAppConstants.apiUrl}/public${getJsonField(
                                                                  disciplinesItem,
                                                                  r'''$.iconURL''',
                                                                ).toString()}'
                                                              : 'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                          'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                        ),
                                                        width: 32.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    getJsonField(
                                                      disciplinesItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model
                                                                        .disciplineUuid ==
                                                                    getJsonField(
                                                                      disciplinesItem,
                                                                      r'''$.uuid''',
                                                                    ).toString()
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasGray,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasGray,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: _model.fields(
                              requestFn: () =>
                                  FieldsGroup.findManyFieldsCall.call(
                                token: FFAppState().token,
                                discipline: _model.disciplineUuid,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewFindManyFieldsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final fields = getJsonField(
                                    listViewFindManyFieldsResponse.jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  if (fields.isEmpty) {
                                    return Container(
                                      width: double.infinity,
                                      child: EmptyDataWidget(
                                        icon: Icon(
                                          Icons.stadium_outlined,
                                          color: Color(0x7F14181B),
                                          size: 60.0,
                                        ),
                                        title: 'Sin Canchas Disponibles',
                                        description:
                                            'Por el momento no hay canchas disponibles para reservar. Intenta nuevamente más tarde.',
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: fields.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 10.0),
                                    itemBuilder: (context, fieldsIndex) {
                                      final fieldsItem = fields[fieldsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var _shouldSetState = false;
                                          _model.field = getJsonField(
                                            fieldsItem,
                                            r'''$.uuid''',
                                          ).toString();
                                          _model.date = dateTimeFormat(
                                            'yyyy-MM-dd',
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.startHour = null;
                                          _model.finishHour = '';
                                          _model.fieldName = getJsonField(
                                            fieldsItem,
                                            r'''$.name''',
                                          ).toString();
                                          _model.slot = '';
                                          _model.hourSlots = [];
                                          setState(() {});
                                          _model.clearCalendarInfoFieldsCache();
                                          _model.slotsOutput4 =
                                              await BookingsGroup
                                                  .getDaySlotsFIELDCall
                                                  .call(
                                            day: _model.date,
                                            field: _model.field,
                                            token: FFAppState().token,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.slotsOutput4?.succeeded ??
                                              true)) {
                                            _model.loading = false;
                                            _model.hourSlots = (_model
                                                        .slotsOutput4
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            setState(() {});
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Ocurrió un error de servidor',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.field ==
                                                      getJsonField(
                                                        fieldsItem,
                                                        r'''$.uuid''',
                                                      ).toString()
                                                  ? FlutterFlowTheme.of(context)
                                                      .atlasPrimary10
                                                  : FlutterFlowTheme.of(context)
                                                      .atlasGray10,
                                              FlutterFlowTheme.of(context)
                                                  .atlasGray10,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.field ==
                                                        getJsonField(
                                                          fieldsItem,
                                                          r'''$.uuid''',
                                                        ).toString()
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .atlasGray10,
                                                FlutterFlowTheme.of(context)
                                                    .atlasGray10,
                                              ),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (getJsonField(
                                                      fieldsItem,
                                                      r'''$.image''',
                                                    ) !=
                                                    null)
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      '${FFAppConstants.apiUrl}/public${getJsonField(
                                                        fieldsItem,
                                                        r'''$.image''',
                                                      ).toString()}',
                                                      width: 75.0,
                                                      height: 75.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      fieldsItem,
                                                      r'''$.image''',
                                                    ) ==
                                                    null)
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/field_placeholder.png',
                                                      width: 75.0,
                                                      height: 75.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          fieldsItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.field ==
                                                                            getJsonField(
                                                                              fieldsItem,
                                                                              r'''$.uuid''',
                                                                            ).toString()
                                                                        ? FlutterFlowTheme.of(context).primary
                                                                        : FlutterFlowTheme.of(context).primaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          fieldsItem,
                                                          r'''$.description''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.field ==
                                                                            getJsonField(
                                                                              fieldsItem,
                                                                              r'''$.uuid''',
                                                                            ).toString()
                                                                        ? FlutterFlowTheme.of(context).primary
                                                                        : FlutterFlowTheme.of(context).atlasGray,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .atlasGray,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      if (_model.fieldSelectable == false)
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: _model.calendarInfo(
                                              requestFn: () => BookingsGroup
                                                  .getCalendarNOFIELDCall
                                                  .call(
                                                token: FFAppState().token,
                                                disciplineUuid:
                                                    _model.disciplineUuid,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitFadingCube(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final noGetCalendarNOFIELDResponse =
                                                  snapshot.data!;

                                              return Container(
                                                width: double.infinity,
                                                height: 350.0,
                                                child: custom_widgets
                                                    .BookingCalendar(
                                                  width: double.infinity,
                                                  height: 350.0,
                                                  availableDates: BookingsGroup
                                                      .getCalendarNOFIELDCall
                                                      .date(
                                                    noGetCalendarNOFIELDResponse
                                                        .jsonBody,
                                                  )!,
                                                  availableSlots: functions
                                                      .returnArrayOfIntegers(
                                                          getJsonField(
                                                    noGetCalendarNOFIELDResponse
                                                        .jsonBody,
                                                    r'''$[:].availableSlots''',
                                                    true,
                                                  )!),
                                                  updatePageState: () async {
                                                    var _shouldSetState = false;
                                                    _model.calendarSelectionOutput =
                                                        await actions
                                                            .getCalendarSelection();
                                                    _shouldSetState = true;
                                                    _model.date =
                                                        valueOrDefault<String>(
                                                      _model
                                                          .calendarSelectionOutput,
                                                      'Sin Valor',
                                                    );
                                                    _model.loading = true;
                                                    _model.startHour = null;
                                                    _model.finishHour = '';
                                                    _model.slot = '';
                                                    setState(() {});
                                                    _model.slotsOutput2 =
                                                        await BookingsGroup
                                                            .getDaySlotsNOFIELDCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      day: _model.date,
                                                      discipline:
                                                          _model.disciplineUuid,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.slotsOutput2
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.loading = false;
                                                      _model.hourSlots = (_model
                                                                  .slotsOutput2
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .cast<dynamic>();
                                                      setState(() {});
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Ocurrió un error de servidor',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 11.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (_model.fieldSelectable == true)
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: _model.calendarInfoFields(
                                              requestFn: () => BookingsGroup
                                                  .getCalendarFIELDSCall
                                                  .call(
                                                disciplineUuid:
                                                    _model.disciplineUuid,
                                                field: _model.field,
                                                token: FFAppState().token,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitFadingCube(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final yesGetCalendarFIELDSResponse =
                                                  snapshot.data!;

                                              return Container(
                                                width: double.infinity,
                                                height: 350.0,
                                                child: custom_widgets
                                                    .BookingCalendar(
                                                  width: double.infinity,
                                                  height: 350.0,
                                                  availableDates: BookingsGroup
                                                      .getCalendarFIELDSCall
                                                      .date(
                                                        yesGetCalendarFIELDSResponse
                                                            .jsonBody,
                                                      )!
                                                      .map((e) => e.toString())
                                                      .toList(),
                                                  availableSlots: functions
                                                      .returnArrayOfIntegers(
                                                          getJsonField(
                                                    yesGetCalendarFIELDSResponse
                                                        .jsonBody,
                                                    r'''$[:].availableSlots''',
                                                    true,
                                                  )!),
                                                  updatePageState: () async {
                                                    var _shouldSetState = false;
                                                    _model.calendarSelectionOutput2 =
                                                        await actions
                                                            .getCalendarSelection();
                                                    _shouldSetState = true;
                                                    _model.date =
                                                        valueOrDefault<String>(
                                                      _model
                                                          .calendarSelectionOutput2,
                                                      'Sin Valor',
                                                    );
                                                    _model.loading = true;
                                                    _model.startHour = null;
                                                    _model.finishHour = '';
                                                    _model.slot = '';
                                                    setState(() {});
                                                    _model.slotsOutput3 =
                                                        await BookingsGroup
                                                            .getDaySlotsFIELDCall
                                                            .call(
                                                      day: _model.date,
                                                      field: _model.field,
                                                      token: FFAppState().token,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.slotsOutput3
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.loading = false;
                                                      _model.hourSlots = (_model
                                                                  .slotsOutput3
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .cast<dynamic>();
                                                      setState(() {});
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Ocurrió un error de servidor',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 11.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (_model.loading)
                                        Container(
                                          width: double.infinity,
                                          height: 350.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x3FFFFFFF),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (!_model.loading)
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final slots = _model.hourSlots.toList();
                                      if (slots.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: double.infinity,
                                            child: NoSlotsEmptyWidget(),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: slots.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 8.0),
                                        itemBuilder: (context, slotsIndex) {
                                          final slotsItem = slots[slotsIndex];
                                          return Opacity(
                                            opacity: !getJsonField(
                                              slotsItem,
                                              r'''$.isAvailable''',
                                            )
                                                ? 0.5
                                                : 1.0,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (getJsonField(
                                                  slotsItem,
                                                  r'''$.isAvailable''',
                                                )) {
                                                  _model.startHour =
                                                      getJsonField(
                                                    slotsItem,
                                                    r'''$.startHour''',
                                                  ).toString();
                                                  _model.finishHour =
                                                      getJsonField(
                                                    slotsItem,
                                                    r'''$.finishHour''',
                                                  ).toString();
                                                  _model.slot = getJsonField(
                                                    slotsItem,
                                                    r'''$.uuid''',
                                                  ).toString();
                                                  setState(() {});
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    (_model.startHour ==
                                                                getJsonField(
                                                                  slotsItem,
                                                                  r'''$.startHour''',
                                                                ).toString()) &&
                                                            (_model
                                                                    .finishHour ==
                                                                getJsonField(
                                                                  slotsItem,
                                                                  r'''$.finishHour''',
                                                                ).toString())
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .atlasPrimary10
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (_model.startHour ==
                                                                  getJsonField(
                                                                    slotsItem,
                                                                    r'''$.startHour''',
                                                                  )
                                                                      .toString()) &&
                                                              (_model
                                                                      .finishHour ==
                                                                  getJsonField(
                                                                    slotsItem,
                                                                    r'''$.finishHour''',
                                                                  ).toString())
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasPrimary75
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 14.0,
                                                          16.0, 14.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (_model.startHour ==
                                                                        getJsonField(
                                                                          slotsItem,
                                                                          r'''$.startHour''',
                                                                        )
                                                                            .toString()) &&
                                                                    (_model
                                                                            .finishHour ==
                                                                        getJsonField(
                                                                          slotsItem,
                                                                          r'''$.finishHour''',
                                                                        )
                                                                            .toString())
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasGray10,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasGray10,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              (_model
                                                                              .startHour ==
                                                                          getJsonField(
                                                                            slotsItem,
                                                                            r'''$.startHour''',
                                                                          )
                                                                              .toString()) &&
                                                                      (_model
                                                                              .finishHour ==
                                                                          getJsonField(
                                                                            slotsItem,
                                                                            r'''$.finishHour''',
                                                                          )
                                                                              .toString())
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .atlasGray,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .atlasGray,
                                                            ),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${getJsonField(
                                                          slotsItem,
                                                          r'''$.startHour''',
                                                        ).toString()}${_model.disciplineShowEndHour ? ' - ' : ''}${_model.disciplineShowEndHour ? getJsonField(
                                                            slotsItem,
                                                            r'''$.finishHour''',
                                                          ).toString() : ''}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (_model.startHour ==
                                                                                getJsonField(
                                                                                  slotsItem,
                                                                                  r'''$.startHour''',
                                                                                ).toString()) &&
                                                                            (_model.finishHour ==
                                                                                getJsonField(
                                                                                  slotsItem,
                                                                                  r'''$.finishHour''',
                                                                                ).toString())
                                                                        ? FlutterFlowTheme.of(context).atlasPrimary
                                                                        : FlutterFlowTheme.of(context).primaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (_model.loading)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Lottie.asset(
                                    'assets/lottie_animations/loading_cards.json',
                                    width: 300.0,
                                    height: 125.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: Color(0x19000000),
                                            offset: Offset(
                                              0.0,
                                              4.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Disciplina',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gotham',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasGray,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.disciplineName !=
                                                                null &&
                                                            _model.disciplineName !=
                                                                ''
                                                        ? _model.disciplineName
                                                        : 'Disciplina',
                                                    'Disciplina',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gotham',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasPrimary25,
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    _model.disciplineIcon !=
                                                                null &&
                                                            _model.disciplineIcon !=
                                                                ''
                                                        ? '${FFAppConstants.apiUrl}/public${_model.disciplineIcon}'
                                                        : 'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                    'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                  ),
                                                  width: 32.0,
                                                  height: 32.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Fecha',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasGray,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              _model.date != null &&
                                                      _model.date != ''
                                                  ? _model.date
                                                  : 'Fecha',
                                              'Fecha',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hora',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasGray,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Text(
                                            '${_model.startHour != null && _model.startHour != '' ? _model.startHour : 'Inicio'}${_model.disciplineShowEndHour != null ? (_model.disciplineShowEndHour ? ' - ' : '') : ''}${_model.disciplineShowEndHour != null ? (_model.disciplineShowEndHour && (_model.finishHour != null && _model.finishHour != '') ? _model.finishHour : '') : ''}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    if (_model.fieldConfig != 'noField')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cancha',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotham',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .atlasGray,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.fieldName != null &&
                                                        _model.fieldName != ''
                                                    ? _model.fieldName
                                                    : 'Te asignaremos una cancha cuando hagas tu reservación.',
                                                'Cancha',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotham',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 16.0),
                                      child: Text(
                                        'Verifica que la información de tu reservación sea correcta. Puedes regresar a cualquiera de los pasos para hacer las modificaciones necesarias.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotham',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: !(((_model.pageViewCurrentIndex == 0) &&
                              (_model.disciplineUuid != null &&
                                  _model.disciplineUuid != '')) ||
                          ((_model.pageViewCurrentIndex == 1) &&
                              (_model.field != null && _model.field != '')) ||
                          ((_model.pageViewCurrentIndex == 2) &&
                              (_model.startHour != null &&
                                  _model.startHour != '') &&
                              (_model.finishHour != null &&
                                  _model.finishHour != '')) ||
                          (_model.pageViewCurrentIndex == 3))
                      ? null
                      : () async {
                          var _shouldSetState = false;
                          if ((_model.pageViewCurrentIndex == 0) &&
                              _model.fieldSelectable) {
                            await _model.pageViewController?.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          } else if ((_model.pageViewCurrentIndex == 0) &&
                              !_model.fieldSelectable) {
                            await _model.pageViewController?.animateToPage(
                              2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          } else if (_model.pageViewCurrentIndex == 2) {
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else if (_model.pageViewCurrentIndex == 3) {
                            if (_model.fieldConfig == 'noField') {
                              _model.noFieldOutput = await BookingsGroup
                                  .createNoFieldBookingCall
                                  .call(
                                date: _model.date,
                                discipline: _model.disciplineUuid,
                                slot: _model.slot,
                                token: FFAppState().token,
                              );

                              _shouldSetState = true;
                              if ((_model.noFieldOutput?.succeeded ?? true)) {
                                context.goNamed(
                                  'ConfirmBookingPage',
                                  queryParameters: {
                                    'bookingUuid': serializeParam(
                                      getJsonField(
                                        (_model.noFieldOutput?.jsonBody ?? ''),
                                        r'''$.uuid''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'date': serializeParam(
                                      functions.dateToHumanDate(getJsonField(
                                        (_model.noFieldOutput?.jsonBody ?? ''),
                                        r'''$.date''',
                                      ).toString()),
                                      ParamType.String,
                                    ),
                                    'startHour': serializeParam(
                                      getJsonField(
                                        (_model.noFieldOutput?.jsonBody ?? ''),
                                        r'''$.startHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'finishHour': serializeParam(
                                      getJsonField(
                                        (_model.noFieldOutput?.jsonBody ?? ''),
                                        r'''$.finishHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'capacity': serializeParam(
                                      getJsonField(
                                        (_model.noFieldOutput?.jsonBody ?? ''),
                                        r'''$.discipline.bookingConfig.maxPeople''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (ErrorStruct.maybeFromMap(
                                            (_model.noFieldOutput?.jsonBody ??
                                                ''))
                                        ?.key ==
                                    'bookings.noMemberAvailability') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error de Reservación'),
                                        content: Text(
                                            'Parece que hay un conflicto con tu reservación. Recuerda que no puedes reservar dos veces la misma disciplina el mismo día ni que tus reservaciones se empalmen en horarios.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Aceptar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No se ha podido crear la reservación',
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
                                }

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else if (_model.fieldConfig == 'random') {
                              _model.randomFieldOutput = await BookingsGroup
                                  .createRandomFieldBookingCall
                                  .call(
                                date: _model.date,
                                discipline: _model.disciplineUuid,
                                startHour: _model.startHour,
                                finishHour: _model.finishHour,
                                token: FFAppState().token,
                              );

                              _shouldSetState = true;
                              if ((_model.randomFieldOutput?.succeeded ??
                                  true)) {
                                context.goNamed(
                                  'ConfirmBookingPage',
                                  queryParameters: {
                                    'bookingUuid': serializeParam(
                                      getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.uuid''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'date': serializeParam(
                                      functions.dateToHumanDate(getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.date''',
                                      ).toString()),
                                      ParamType.String,
                                    ),
                                    'startHour': serializeParam(
                                      getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.startHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'finishHour': serializeParam(
                                      getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.finishHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'fieldName': serializeParam(
                                      getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.field.name''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'capacity': serializeParam(
                                      getJsonField(
                                        (_model.randomFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.field.discipline.bookingConfig.maxPeople''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (ErrorStruct.maybeFromMap((_model
                                                .randomFieldOutput?.jsonBody ??
                                            ''))
                                        ?.key ==
                                    'bookings.noMemberAvailability') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error de Reservación'),
                                        content: Text(
                                            'Parece que hay un conflicto con tu reservación. Recuerda que no puedes reservar dos veces la misma disciplina el mismo día ni que tus reservaciones se empalmen en horarios.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Aceptar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No se ha podido crear la reservación',
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
                                }

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else if (_model.fieldConfig == 'user') {
                              _model.userFieldOutput = await BookingsGroup
                                  .createFieldBookingCall
                                  .call(
                                date: _model.date,
                                field: _model.field,
                                slot: _model.slot,
                                token: FFAppState().token,
                              );

                              _shouldSetState = true;
                              if ((_model.userFieldOutput?.succeeded ?? true)) {
                                context.goNamed(
                                  'ConfirmBookingPage',
                                  queryParameters: {
                                    'bookingUuid': serializeParam(
                                      getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.uuid''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'date': serializeParam(
                                      functions.dateToHumanDate(getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.date''',
                                      ).toString()),
                                      ParamType.String,
                                    ),
                                    'startHour': serializeParam(
                                      getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.startHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'finishHour': serializeParam(
                                      getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.finishHour''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'fieldName': serializeParam(
                                      getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.field.name''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'capacity': serializeParam(
                                      getJsonField(
                                        (_model.userFieldOutput?.jsonBody ??
                                            ''),
                                        r'''$.field.discipline.bookingConfig.maxPeople''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (ErrorStruct.maybeFromMap(
                                            (_model.userFieldOutput?.jsonBody ??
                                                ''))
                                        ?.key ==
                                    'bookings.noMemberAvailability') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error de Reservación'),
                                        content: Text(
                                            'Parece que hay un conflicto con tu reservación. Recuerda que no puedes reservar dos veces la misma disciplina el mismo día ni que tus reservaciones se empalmen en horarios.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Aceptar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No se ha podido crear la reservación',
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
                                }

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else if (_model.pageViewCurrentIndex == 1) {
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Algo ha salido mal...',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }

                          if (_shouldSetState) setState(() {});
                        },
                  text: 'Siguiente',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                    disabledColor: FlutterFlowTheme.of(context).atlasPrimary50,
                    disabledTextColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
