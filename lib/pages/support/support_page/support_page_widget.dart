import '/backend/api_requests/api_calls.dart';
import '/components/global/empty_data/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_page_model.dart';
export 'support_page_model.dart';

class SupportPageWidget extends StatefulWidget {
  const SupportPageWidget({super.key});

  @override
  State<SupportPageWidget> createState() => _SupportPageWidgetState();
}

class _SupportPageWidgetState extends State<SupportPageWidget> {
  late SupportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportPageModel());
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.pushNamed('NewTicketPage');
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
                'Nuevo Ticket',
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
            'Soporte',
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(SupportGroup.findManyTicketsCall.call(
                                token: FFAppState().token,
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                          ),
                        );
                      }
                      final listViewFindManyTicketsResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final notices = getJsonField(
                            listViewFindManyTicketsResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          if (notices.isEmpty) {
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: EmptyDataWidget(
                                icon: Icon(
                                  Icons.support_rounded,
                                ),
                                title: 'Sin Tickets de Soporte',
                                description:
                                    'No tienes ningún ticket de soporte, pero puedes abrir uno en cualquier momento.',
                              ),
                            );
                          }

                          return RefreshIndicator(
                            color: FlutterFlowTheme.of(context).atlasPrimary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).atlasBlack,
                            strokeWidth: 2.0,
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                16.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: notices.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, noticesIndex) {
                                final noticesItem = notices[noticesIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SupportDetailPage',
                                      queryParameters: {
                                        'uuid': serializeParam(
                                          getJsonField(
                                            noticesItem,
                                            r'''$.uuid''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (getJsonField(
                                                    noticesItem,
                                                    r'''$.unread.member''',
                                                  ))
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons
                                                              .notifications_active,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    getJsonField(
                                                      noticesItem,
                                                      r'''$.subject''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                              Text(
                                                getJsonField(
                                                  noticesItem,
                                                  r'''$.description''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 80,
                                                      replacement: '…',
                                                    ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.flag_rounded,
                                                      color: () {
                                                        if ('low' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return Color(
                                                              0xFFBFBFBF);
                                                        } else if ('medium' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return Color(
                                                              0xFFA0D911);
                                                        } else if ('high' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return Color(
                                                              0xFFFA8C16);
                                                        } else if ('urgent' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return Color(
                                                              0xFFFA541C);
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      size: 18.0,
                                                    ),
                                                    Text(
                                                      () {
                                                        if ('low' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return 'Baja';
                                                        } else if ('medium' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return 'Media';
                                                        } else if ('high' ==
                                                            getJsonField(
                                                              noticesItem,
                                                              r'''$.priority''',
                                                            ).toString()) {
                                                          return 'Alta';
                                                        } else if ('urgent' ==
                                                            getJsonField(
                                                              noticesItem,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 14.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if ('pending' ==
                                                              getJsonField(
                                                                noticesItem,
                                                                r'''$.status''',
                                                              ).toString()) {
                                                            return Color(
                                                                0xFF1677FF);
                                                          } else if ('cancelled' ==
                                                              getJsonField(
                                                                noticesItem,
                                                                r'''$.status''',
                                                              ).toString()) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText;
                                                          } else if ('onHold' ==
                                                              getJsonField(
                                                                noticesItem,
                                                                r'''$.status''',
                                                              ).toString()) {
                                                            return Color(
                                                                0xFF389E0D);
                                                          } else {
                                                            return Color(
                                                                0x00000000);
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    4.0),
                                                        child: Text(
                                                          () {
                                                            if ('pending' ==
                                                                getJsonField(
                                                                  noticesItem,
                                                                  r'''$.status''',
                                                                ).toString()) {
                                                              return 'Abierto';
                                                            } else if ('cancelled' ==
                                                                getJsonField(
                                                                  noticesItem,
                                                                  r'''$.status''',
                                                                ).toString()) {
                                                              return 'Cancelado';
                                                            } else if ('waiting' ==
                                                                getJsonField(
                                                                  noticesItem,
                                                                  r'''$.status''',
                                                                ).toString()) {
                                                              return 'En Espera';
                                                            } else if ('closed' ==
                                                                getJsonField(
                                                                  noticesItem,
                                                                  r'''$.status''',
                                                                ).toString()) {
                                                              return 'Cerrado';
                                                            } else {
                                                              return 'Estado';
                                                            }
                                                          }(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .chat_bubble_outline_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  TicketStruct.maybeFromMap(
                                                                          noticesItem)
                                                                      ?.conversation
                                                                      ?.length
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gotham',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .attach_file,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  TicketStruct.maybeFromMap(
                                                                          noticesItem)
                                                                      ?.files
                                                                      ?.length
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gotham',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 6.0)),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
