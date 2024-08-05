import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_preferences_page_model.dart';
export 'my_preferences_page_model.dart';

class MyPreferencesPageWidget extends StatefulWidget {
  const MyPreferencesPageWidget({super.key});

  @override
  State<MyPreferencesPageWidget> createState() =>
      _MyPreferencesPageWidgetState();
}

class _MyPreferencesPageWidgetState extends State<MyPreferencesPageWidget>
    with TickerProviderStateMixin {
  late MyPreferencesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPreferencesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      setState(() {});
      _model.profileOutput = await MemberGroup.getMemberProfileCall.call(
        token: FFAppState().token,
      );

      if ((_model.profileOutput?.succeeded ?? true)) {
        _model.sport = (MemberGroup.getMemberProfileCall.sportUuid(
                          (_model.profileOutput?.jsonBody ?? ''),
                        ) !=
                        null &&
                    (MemberGroup.getMemberProfileCall.sportUuid(
                      (_model.profileOutput?.jsonBody ?? ''),
                    ))!
                        .isNotEmpty) ==
                true
            ? MemberGroup.getMemberProfileCall
                .sportUuid(
                  (_model.profileOutput?.jsonBody ?? ''),
                )!
                .map((e) => e.toString())
                .toList()
            : ([]).toList().cast<String>();
        _model.hobbies = (MemberGroup.getMemberProfileCall.hobbyUuid(
                          (_model.profileOutput?.jsonBody ?? ''),
                        ) !=
                        null &&
                    (MemberGroup.getMemberProfileCall.hobbyUuid(
                      (_model.profileOutput?.jsonBody ?? ''),
                    ))!
                        .isNotEmpty) ==
                true
            ? MemberGroup.getMemberProfileCall
                .hobbyUuid(
                  (_model.profileOutput?.jsonBody ?? ''),
                )!
                .map((e) => e.toString())
                .toList()
            : ([]).toList().cast<String>();
        _model.profession = getJsonField(
                  (_model.profileOutput?.jsonBody ?? ''),
                  r'''$.profession.uuid''',
                ) !=
                null
            ? getJsonField(
                (_model.profileOutput?.jsonBody ?? ''),
                r'''$.profession.uuid''',
              ).toString().toString()
            : 'null';
        _model.loading = false;
        setState(() {});
        return;
      } else {
        context.safePop();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Algo salió mal al tratar de recuperar tu perfil...',
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
      length: 3,
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
              context.safePop();
            },
          ),
          title: Text(
            'Mis Preferencias',
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: false,
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
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderWidth: 0.0,
                        borderRadius: 0.0,
                        elevation: 0.0,
                        tabs: [
                          Tab(
                            text: 'Deportes',
                          ),
                          Tab(
                            text: 'Aficiones',
                          ),
                          Tab(
                            text: 'Profesión',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: _model.sports(
                                        requestFn: () => DisciplinesGroup
                                            .findManyDisciplinesCall
                                            .call(
                                          token: FFAppState().token,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final wrapFindManyDisciplinesResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final disciplines = getJsonField(
                                              wrapFindManyDisciplinesResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                            ).toList();

                                            return Wrap(
                                              spacing: 12.0,
                                              runSpacing: 12.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.antiAlias,
                                              children: List.generate(
                                                  disciplines.length,
                                                  (disciplinesIndex) {
                                                final disciplinesItem =
                                                    disciplines[
                                                        disciplinesIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.sport
                                                        .contains(getJsonField(
                                                      disciplinesItem,
                                                      r'''$.uuid''',
                                                    ).toString())) {
                                                      _model.removeFromSport(
                                                          getJsonField(
                                                        disciplinesItem,
                                                        r'''$.uuid''',
                                                      ).toString());
                                                      setState(() {});
                                                    } else {
                                                      _model.addToSport(
                                                          getJsonField(
                                                        disciplinesItem,
                                                        r'''$.uuid''',
                                                      ).toString());
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.sport.contains(
                                                                getJsonField(
                                                          disciplinesItem,
                                                          r'''$.uuid''',
                                                        ).toString())
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasPrimary10
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasGray10,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .atlasGray10,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.sport.contains(
                                                                  getJsonField(
                                                            disciplinesItem,
                                                            r'''$.uuid''',
                                                          ).toString())
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(14.0),
                                                      child: Text(
                                                        getJsonField(
                                                          disciplinesItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.sport
                                                                            .contains(getJsonField(
                                                                      disciplinesItem,
                                                                      r'''$.uuid''',
                                                                    ).toString())
                                                                        ? FlutterFlowTheme.of(context).primary
                                                                        : FlutterFlowTheme.of(context).atlasGray,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .atlasGray,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.sportsOutput =
                                              await MemberGroup.updateMetasCall
                                                  .call(
                                            token: FFAppState().token,
                                            type: 'sports',
                                            dataList: _model.sport,
                                          );

                                          if ((_model.sportsOutput?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Información actualizada correctamente',
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
                                                        .success,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'No se pudo actualizar tu información...',
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
                                          }

                                          setState(() {});
                                        },
                                        text: 'Guardar Cambios',
                                        icon: Icon(
                                          Icons.save,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 52.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Gotham',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: _model.hobby(
                                        requestFn: () =>
                                            MemberGroup.memberMetasCall.call(
                                          token: FFAppState().token,
                                          filterType: 'hobby',
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final wrapMemberMetasResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final metas = getJsonField(
                                              wrapMemberMetasResponse.jsonBody,
                                              r'''$.data''',
                                            ).toList();

                                            return Wrap(
                                              spacing: 12.0,
                                              runSpacing: 12.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.antiAlias,
                                              children: List.generate(
                                                  metas.length, (metasIndex) {
                                                final metasItem =
                                                    metas[metasIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.hobbies
                                                        .contains(getJsonField(
                                                      metasItem,
                                                      r'''$.uuid''',
                                                    ).toString())) {
                                                      _model.removeFromHobbies(
                                                          getJsonField(
                                                        metasItem,
                                                        r'''$.uuid''',
                                                      ).toString());
                                                      setState(() {});
                                                    } else {
                                                      _model.addToHobbies(
                                                          getJsonField(
                                                        metasItem,
                                                        r'''$.uuid''',
                                                      ).toString());
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.hobbies.contains(
                                                                getJsonField(
                                                          metasItem,
                                                          r'''$.uuid''',
                                                        ).toString())
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasPrimary10
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasGray10,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .atlasGray10,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.hobbies.contains(
                                                                  getJsonField(
                                                            metasItem,
                                                            r'''$.uuid''',
                                                          ).toString())
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(14.0),
                                                      child: Text(
                                                        getJsonField(
                                                          metasItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.hobbies
                                                                            .contains(getJsonField(
                                                                      metasItem,
                                                                      r'''$.uuid''',
                                                                    ).toString())
                                                                        ? FlutterFlowTheme.of(context).primary
                                                                        : FlutterFlowTheme.of(context).atlasGray,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .atlasGray,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.disciplineOutput =
                                              await MemberGroup.updateMetasCall
                                                  .call(
                                            token: FFAppState().token,
                                            type: 'hobbies',
                                            dataList: _model.hobbies,
                                          );

                                          if ((_model.disciplineOutput
                                                  ?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Información actualizada correctamente',
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
                                                        .success,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'No se pudo actualizar tu información...',
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
                                          }

                                          setState(() {});
                                        },
                                        text: 'Guardar Cambios',
                                        icon: Icon(
                                          Icons.save,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 52.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Gotham',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: _model.professions(
                                        requestFn: () =>
                                            MemberGroup.memberMetasCall.call(
                                          filterType: 'profession',
                                          token: FFAppState().token,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewMemberMetasResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final professions = getJsonField(
                                              listViewMemberMetasResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                            ).toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: professions.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, professionsIndex) {
                                                final professionsItem =
                                                    professions[
                                                        professionsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.profession =
                                                        getJsonField(
                                                      professionsItem,
                                                      r'''$.uuid''',
                                                    ).toString();
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 65.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.profession ==
                                                                getJsonField(
                                                                  professionsItem,
                                                                  r'''$.uuid''',
                                                                ).toString()
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasPrimary10
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasGray10,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .atlasGray10,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.profession ==
                                                                  getJsonField(
                                                                    professionsItem,
                                                                    r'''$.uuid''',
                                                                  ).toString()
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .atlasPrimary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              professionsItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.profession ==
                                                                            getJsonField(
                                                                              professionsItem,
                                                                              r'''$.uuid''',
                                                                            ).toString()
                                                                        ? FlutterFlowTheme.of(context).atlasPrimary
                                                                        : FlutterFlowTheme.of(context).atlasGray,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .atlasGray,
                                                                  ),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 20.0)),
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.professionOutput =
                                            await MemberGroup
                                                .updateMetasPROFESSIONCall
                                                .call(
                                          type: 'profession',
                                          data: _model.profession,
                                          token: FFAppState().token,
                                        );

                                        if ((_model
                                                .professionOutput?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Información actualizada correctamente',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 11.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'No se pudo actualizar tu información...',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 11.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: 'Guardar Cambios',
                                      icon: Icon(
                                        Icons.save,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 52.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Gotham',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
