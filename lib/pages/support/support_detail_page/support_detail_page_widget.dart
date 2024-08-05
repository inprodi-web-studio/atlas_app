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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'support_detail_page_model.dart';
export 'support_detail_page_model.dart';

class SupportDetailPageWidget extends StatefulWidget {
  const SupportDetailPageWidget({
    super.key,
    required this.uuid,
  });

  final String? uuid;

  @override
  State<SupportDetailPageWidget> createState() =>
      _SupportDetailPageWidgetState();
}

class _SupportDetailPageWidgetState extends State<SupportDetailPageWidget>
    with TickerProviderStateMixin {
  late SupportDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ticketOutput = await SupportGroup.findOneTicketCall.call(
        uuid: widget!.uuid,
        token: FFAppState().token,
      );

      if ((_model.ticketOutput?.succeeded ?? true)) {
        _model.conversation = getJsonField(
          (_model.ticketOutput?.jsonBody ?? ''),
          r'''$.conversation''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        _model.loading = false;
        _model.filesList = getJsonField(
          (_model.ticketOutput?.jsonBody ?? ''),
          r'''$.files''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        setState(() {});
      } else {
        context.pushNamed('SupportPage');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se pudo consultar el ticket',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 11.0,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();
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
              context.pushNamed(
                'SupportPage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
          ),
          title: Text(
            'Ticket',
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
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.more_vert,
                color: FlutterFlowTheme.of(context).atlasBlack,
                size: 24.0,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Container(
                          height: 150.0,
                          child: TicketOptionsWidget(
                            uuid: widget!.uuid!,
                          ),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!_model.loading)
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor1,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          (_model.ticketOutput?.jsonBody ?? ''),
                                          r'''$.subject''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotham',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          (_model.ticketOutput?.jsonBody ?? ''),
                                          r'''$.description''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotham',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.flag_rounded,
                                              color: () {
                                                if ('low' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return Color(0xFFBFBFBF);
                                                } else if ('medium' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return Color(0xFFA0D911);
                                                } else if ('high' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return Color(0xFFFA8C16);
                                                } else if ('urgent' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return Color(0xFFFA541C);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              size: 18.0,
                                            ),
                                            Text(
                                              () {
                                                if ('low' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return 'Baja';
                                                } else if ('medium' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return 'Media';
                                                } else if ('high' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return 'Alta';
                                                } else if ('urgent' ==
                                                    getJsonField(
                                                      (_model.ticketOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.priority''',
                                                    ).toString()) {
                                                  return 'Urgente';
                                                } else {
                                                  return 'Prioridad';
                                                }
                                              }()
                                                  .maybeHandleOverflow(
                                                maxChars: 200,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gotham',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 14.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if ('pending' ==
                                                      getJsonField(
                                                        (_model.ticketOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.status''',
                                                      ).toString()) {
                                                    return Color(0xFF1677FF);
                                                  } else if ('cancelled' ==
                                                      getJsonField(
                                                        (_model.ticketOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.status''',
                                                      ).toString()) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText;
                                                  } else if ('onHold' ==
                                                      getJsonField(
                                                        (_model.ticketOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.status''',
                                                      ).toString()) {
                                                    return Color(0xFF389E0D);
                                                  } else {
                                                    return Color(0x00000000);
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 4.0, 10.0, 4.0),
                                                child: Text(
                                                  () {
                                                    if ('pending' ==
                                                        getJsonField(
                                                          (_model.ticketOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.status''',
                                                        ).toString()) {
                                                      return 'Abierto';
                                                    } else if ('cancelled' ==
                                                        getJsonField(
                                                          (_model.ticketOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.status''',
                                                        ).toString()) {
                                                      return 'Cancelado';
                                                    } else if ('waiting' ==
                                                        getJsonField(
                                                          (_model.ticketOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.status''',
                                                        ).toString()) {
                                                      return 'En Espera';
                                                    } else if ('closed' ==
                                                        getJsonField(
                                                          (_model.ticketOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.status''',
                                                        ).toString()) {
                                                      return 'Cerrado';
                                                    } else {
                                                      return 'Estado';
                                                    }
                                                  }(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gotham',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 6.0)),
                                  ),
                                ),
                                StyledDivider(
                                  height: 1.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fecha de Creación',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotham',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        functions.dateToHumanDate(getJsonField(
                                          (_model.ticketOutput?.jsonBody ?? ''),
                                          r'''$.createdAt''',
                                        ).toString()),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotham',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          constraints: BoxConstraints(
                            maxHeight: 800.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Gotham',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                  unselectedBorderColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                  borderWidth: 1.0,
                                  borderRadius: 10.0,
                                  elevation: 0.0,
                                  buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.chat_bubble_outline_sharp,
                                            size: 18.0,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Mensajes',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.attach_file,
                                            size: 18.0,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Archivos',
                                        ),
                                      ],
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final messages = _model
                                                        .conversation
                                                        .toList();
                                                    if (messages.isEmpty) {
                                                      return Container(
                                                        width: double.infinity,
                                                        child: EmptyDataWidget(
                                                          icon: Icon(
                                                            Icons
                                                                .chat_bubble_outline_sharp,
                                                          ),
                                                          title: 'Sin Mensajes',
                                                          description:
                                                              'Notificaremos a nuestro departamento de soporte de nuevos mensajes.',
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          messages.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 10.0),
                                                      itemBuilder: (context,
                                                          messagesIndex) {
                                                        final messagesItem =
                                                            messages[
                                                                messagesIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (FFAppState()
                                                                    .uuid ==
                                                                getJsonField(
                                                                  messagesItem,
                                                                  r'''$.user.uuid''',
                                                                ).toString())
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.8,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              6.0,
                                                                              10.0,
                                                                              6.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              messagesItem,
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Gotham',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              4.0,
                                                                              10.0,
                                                                              6.0),
                                                                          child:
                                                                              Text(
                                                                            functions.dateToHumanDate(getJsonField(
                                                                              messagesItem,
                                                                              r'''$.date''',
                                                                            ).toString()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Gotham',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                    .uuid !=
                                                                getJsonField(
                                                                  messagesItem,
                                                                  r'''$.user.uuid''',
                                                                ).toString())
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.8,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Html(
                                                                            data:
                                                                                '<span style=\"color: white\">${getJsonField(
                                                                              messagesItem,
                                                                              r'''$.message''',
                                                                            ).toString()}</span>',
                                                                            onLinkTap: (url, _, __) =>
                                                                                launchURL(url!),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              functions.dateToHumanDate(getJsonField(
                                                                                messagesItem,
                                                                                r'''$.date''',
                                                                              ).toString()),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Gotham',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .phoneTextController,
                                                        focusNode: _model
                                                            .phoneFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.phoneTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                          () => setState(() {}),
                                                        ),
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Gotham',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .atlasGray50,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          hintText:
                                                              'Escribe un mensaje...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Gotham',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Gotham',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasGray,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasPrimary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x41FFFFFF),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x41FFFFFF),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Gotham',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasBlack,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        validator: _model
                                                            .phoneTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0x00EE3524),
                                                    borderRadius: 20.0,
                                                    borderWidth: 0.0,
                                                    buttonSize: 36.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    disabledColor:
                                                        Color(0x80EE3524),
                                                    icon: Icon(
                                                      Icons.send_rounded,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 18.0,
                                                    ),
                                                    onPressed:
                                                        (_model.phoneTextController
                                                                        .text ==
                                                                    null ||
                                                                _model.phoneTextController
                                                                        .text ==
                                                                    '')
                                                            ? null
                                                            : () async {
                                                                _model.loading =
                                                                    true;
                                                                setState(() {});
                                                                _model.messageOutput =
                                                                    await SupportGroup
                                                                        .sendMessageCall
                                                                        .call(
                                                                  token:
                                                                      FFAppState()
                                                                          .token,
                                                                  uuid: widget!
                                                                      .uuid,
                                                                  message: _model
                                                                      .phoneTextController
                                                                      .text,
                                                                );

                                                                setState(() {
                                                                  _model
                                                                      .phoneTextController
                                                                      ?.clear();
                                                                });
                                                                if ((_model
                                                                        .messageOutput
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model.conversation =
                                                                      getJsonField(
                                                                    (_model.messageOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.conversation''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Hubo un error al enviar el mensaje',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              11.0,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                }

                                                                _model.loading =
                                                                    false;
                                                                setState(() {});

                                                                setState(() {});
                                                              },
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 6.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                                allowVideo: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }

                                              _model.loading = true;
                                              setState(() {});
                                              _model.uploadOutput =
                                                  await SupportGroup
                                                      .uploadTicketFileUpdateCall
                                                      .call(
                                                uuid: widget!.uuid,
                                                token: FFAppState().token,
                                                file: _model.uploadedLocalFile,
                                              );

                                              if ((_model.uploadOutput
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.addToFilesList(
                                                    getJsonField(
                                                  (_model.uploadOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$''',
                                                ));
                                                setState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Hubo un error al subir el archivo',
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
                                              }

                                              _model.loading = false;
                                              setState(() {});

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.cloud_upload_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    'Subir Archivo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (getJsonField(
                                              (_model.ticketOutput?.jsonBody ??
                                                  ''),
                                              r'''$.files''',
                                            ) !=
                                            null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final files =
                                                    _model.filesList.toList();
                                                if (files.isEmpty) {
                                                  return EmptyDataWidget(
                                                    icon: Icon(
                                                      Icons.attach_file,
                                                    ),
                                                    title: 'Sin Archivos',
                                                    description:
                                                        'No se han adjuntado archivos a este ticket.',
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: files.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 10.0),
                                                  itemBuilder:
                                                      (context, filesIndex) {
                                                    final filesItem =
                                                        files[filesIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                              width: 50.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Opacity(
                                                                opacity: 0.5,
                                                                child: Icon(
                                                                  Icons
                                                                      .file_present_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
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
                                                                Text(
                                                                  getJsonField(
                                                                    filesItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gotham',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '${getJsonField(
                                                                    filesItem,
                                                                    r'''$.size''',
                                                                  ).toString()} Kb',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gotham',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 14.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 18.0)),
                    ),
                  ),
                if (_model.loading)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Lottie.asset(
                        'assets/lottie_animations/loading_cards.json',
                        width: 300.0,
                        height: 125.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
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
