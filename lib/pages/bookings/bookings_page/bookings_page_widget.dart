import '/backend/api_requests/api_calls.dart';
import '/components/bookings/booking_detail/booking_detail_widget.dart';
import '/components/bookings/history_bookings_empty/history_bookings_empty_widget.dart';
import '/components/bookings/next_bookings_empty/next_bookings_empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookings_page_model.dart';
export 'bookings_page_model.dart';

class BookingsPageWidget extends StatefulWidget {
  const BookingsPageWidget({super.key});

  @override
  State<BookingsPageWidget> createState() => _BookingsPageWidgetState();
}

class _BookingsPageWidgetState extends State<BookingsPageWidget>
    with TickerProviderStateMixin {
  late BookingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingsPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.pushNamed(
              'MakeBookingPage',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.bottomToTop,
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          label: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ),
              Text(
                'Reservar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(SizedBox(width: 14.0)),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
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
              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            'Reservaciones',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Gotham',
                  color: FlutterFlowTheme.of(context).atlasBlack,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Gotham',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Gotham',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 2.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 0.0),
                      tabs: [
                        Tab(
                          text: 'Próximas',
                        ),
                        Tab(
                          text: 'Historial',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter2 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(BookingsGroup
                                              .findManyPendingBookingsCall
                                              .call(
                                            token: FFAppState().token,
                                            sort1: 'date',
                                            sort2: 'startHour',
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitFadingFour(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewFindManyPendingBookingsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final bookings = BookingsGroup
                                              .findManyPendingBookingsCall
                                              .data(
                                                listViewFindManyPendingBookingsResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                      if (bookings.isEmpty) {
                                        return NextBookingsEmptyWidget();
                                      }

                                      return RefreshIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .atlasPrimary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .atlasBlack,
                                        strokeWidth: 2.0,
                                        onRefresh: () async {
                                          setState(() => _model
                                              .apiRequestCompleter2 = null);
                                          await _model
                                              .waitForApiRequestCompleted2();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: bookings.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, bookingsIndex) {
                                            final bookingsItem =
                                                bookings[bookingsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.85,
                                                          child:
                                                              BookingDetailWidget(
                                                            bookingUuid:
                                                                getJsonField(
                                                              bookingsItem,
                                                              r'''$.uuid''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 75.0,
                                                              height: 75.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary10,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.discipline.iconURL''',
                                                                          ) !=
                                                                          null
                                                                      ? '${FFAppConstants.apiUrl}/public${getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.discipline.iconURL''',
                                                                        ).toString()}'
                                                                      : 'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                                  'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                                ),
                                                                width: 30.0,
                                                                height: 30.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.field.name''',
                                                                          ) !=
                                                                          null
                                                                      ? '${getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.field.name''',
                                                                        ).toString()} - ${getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.field.discipline.name''',
                                                                        ).toString()}'
                                                                      : getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.discipline.name''',
                                                                        ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gotham',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .calendar_month,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).atlasGray,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Text(
                                                                          '${functions.dateToHumanDate(getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.date''',
                                                                          ).toString())} - ${functions.hourToHumanHour(getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.startHour''',
                                                                          ).toString())}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gotham',
                                                                                color: FlutterFlowTheme.of(context).atlasGray75,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .people_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).atlasGray,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Text(
                                                                          '${functions.getArrayLength(getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.attendants''',
                                                                                true,
                                                                              )!).toString()} invitados',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gotham',
                                                                                color: FlutterFlowTheme.of(context).atlasGray75,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 8.0)),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(BookingsGroup
                                              .findManyHistoryBookingsCall
                                              .call(
                                            token: FFAppState().token,
                                            sort1: 'date',
                                            sort2: 'startHour',
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitFadingFour(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewFindManyHistoryBookingsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final bookings = BookingsGroup
                                              .findManyHistoryBookingsCall
                                              .data(
                                                listViewFindManyHistoryBookingsResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                      if (bookings.isEmpty) {
                                        return HistoryBookingsEmptyWidget();
                                      }

                                      return RefreshIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .atlasPrimary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .atlasBlack,
                                        strokeWidth: 2.0,
                                        onRefresh: () async {
                                          setState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: bookings.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, bookingsIndex) {
                                            final bookingsItem =
                                                bookings[bookingsIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 75.0,
                                                            height: 75.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasPrimary10,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.discipline.iconURL''',
                                                                        ) !=
                                                                        null
                                                                    ? '${FFAppConstants.apiUrl}/public${getJsonField(
                                                                        bookingsItem,
                                                                        r'''$.discipline.iconURL''',
                                                                      ).toString()}'
                                                                    : 'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                                'https://atlas-api.clubconnect.mx/public/uploads/icons8_inactive_state_96_2296bab1b0.png',
                                                              ),
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                              bookingsItem,
                                                                              r'''$.field.name''',
                                                                            ) !=
                                                                            null
                                                                        ? '${getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.field.name''',
                                                                          ).toString()} - ${getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.field.discipline.name''',
                                                                          ).toString()}'
                                                                        : getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.discipline.name''',
                                                                          ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Gotham',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width: 17.0,
                                                                    height:
                                                                        17.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: functions.getStatusColor(
                                                                          'dark',
                                                                          getJsonField(
                                                                            bookingsItem,
                                                                            r'''$.status''',
                                                                          ).toString()),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              0.0,
                                                                          color: functions.getStatusColor(
                                                                              'light',
                                                                              getJsonField(
                                                                                bookingsItem,
                                                                                r'''$.status''',
                                                                              ).toString()),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            0.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              3.0,
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: functions.getStatusColor(
                                                                            'dark',
                                                                            getJsonField(
                                                                              bookingsItem,
                                                                              r'''$.status''',
                                                                            ).toString()),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (functions.getStatusColor(
                                                                                'dark',
                                                                                getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.status''',
                                                                                ).toString()) ==
                                                                            Color(0xFF979899))
                                                                          Icon(
                                                                            Icons.stop_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        if (functions.getStatusColor(
                                                                                'dark',
                                                                                getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.status''',
                                                                                ).toString()) ==
                                                                            Color(0xFFCF1322))
                                                                          Icon(
                                                                            Icons.close_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        if (functions.getStatusColor(
                                                                                'dark',
                                                                                getJsonField(
                                                                                  bookingsItem,
                                                                                  r'''$.status''',
                                                                                ).toString()) ==
                                                                            Color(0xFF389E0D))
                                                                          Icon(
                                                                            Icons.check_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .atlasGray,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        '${functions.dateToHumanDate(getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.date''',
                                                                        ).toString())} - ${functions.hourToHumanHour(getJsonField(
                                                                          bookingsItem,
                                                                          r'''$.startHour''',
                                                                        ).toString())}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Gotham',
                                                                              color: FlutterFlowTheme.of(context).atlasGray75,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .people_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .atlasGray,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        '${functions.getArrayLength(getJsonField(
                                                                              bookingsItem,
                                                                              r'''$.attendants''',
                                                                              true,
                                                                            )!).toString()} invitados',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Gotham',
                                                                              color: FlutterFlowTheme.of(context).atlasGray75,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        6.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
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
    );
  }
}
