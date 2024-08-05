import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'complete_profile_page_model.dart';
export 'complete_profile_page_model.dart';

class CompleteProfilePageWidget extends StatefulWidget {
  const CompleteProfilePageWidget({super.key});

  @override
  State<CompleteProfilePageWidget> createState() =>
      _CompleteProfilePageWidgetState();
}

class _CompleteProfilePageWidgetState extends State<CompleteProfilePageWidget> {
  late CompleteProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteProfilePageModel());

    _model.phoneTextController ??= TextEditingController(text: _model.phone);
    _model.phoneFocusNode ??= FocusNode();

    _model.searchDisciplineTextController ??= TextEditingController();
    _model.searchDisciplineFocusNode ??= FocusNode();

    _model.searchHobbiesTextController ??= TextEditingController();
    _model.searchHobbiesFocusNode ??= FocusNode();

    _model.searchProfessionTextController ??= TextEditingController();
    _model.searchProfessionFocusNode ??= FocusNode();
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
      future: _model.profile(
        requestFn: () => MemberGroup.getMemberProfileCall.call(
          token: FFAppState().token,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final completeProfilePageGetMemberProfileResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) => setState(() {}),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/sport_icons.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/dark_logo.png',
                                          width: 250.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Personaliza tu App',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasBlack,
                                                  fontSize: 34.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          Text(
                                            'Contesta unas preguntas para que personalicemos tu experiencia de la aplicación. Te tomará solo unos minutos.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasBlack75,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ].divide(SizedBox(height: 50.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 50.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Corrobora tus Datos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .atlasBlack,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Género',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasBlack75,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.gender = 'male';
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 65.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.gender ==
                                                            'male'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .atlasPrimary10
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .atlasGray10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: _model.gender ==
                                                              'male'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasPrimary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.male_rounded,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.gender ==
                                                                    'male'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasGray,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasGray,
                                                          ),
                                                          size: 32.0,
                                                        ),
                                                        Text(
                                                          'Masculino',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.gender ==
                                                                          'male'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasPrimary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasGray,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .atlasGray,
                                                                ),
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 20.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.gender = 'female';
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 65.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .atlasGray10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: _model.gender ==
                                                              'female'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasPrimary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.female_rounded,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.gender ==
                                                                    'female'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasGray,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasGray,
                                                          ),
                                                          size: 32.0,
                                                        ),
                                                        Text(
                                                          'Femenino',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.gender ==
                                                                          'female'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasPrimary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasGray,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .atlasGray,
                                                                ),
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 20.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Celular',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasBlack75,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.phoneTextController,
                                              focusNode: _model.phoneFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.phoneTextController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  _model.phone = _model
                                                      .phoneTextController.text;
                                                  setState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .atlasGray50,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                errorStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .atlasGray,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .atlasPrimary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x41FFFFFF),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x41FFFFFF),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 20.0,
                                                            0.0, 20.0),
                                                prefixIcon: Icon(
                                                  Icons.smartphone_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasGray,
                                                  size: 20.0,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gotham',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .atlasBlack,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .phoneTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.phoneMask
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Fecha de Nacimiento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasBlack75,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final _datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: functions
                                                    .dateStringToDate(_model
                                                                    .birthdate !=
                                                                null &&
                                                            _model.birthdate !=
                                                                ''
                                                        ? _model.birthdate!
                                                        : '1997-01-01'),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Gotham',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    _datePickedDate.year,
                                                    _datePickedDate.month,
                                                    _datePickedDate.day,
                                                  );
                                                });
                                              }
                                              _model.birthdate = dateTimeFormat(
                                                'yyyy-MM-dd',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .atlasGray,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 16.0, 10.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray,
                                                      size: 20.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.birthdate !=
                                                                'null'
                                                            ? _model.birthdate
                                                            : 'YYYY - MM - DD',
                                                        'YYYY - MM - DD',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Gotham',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.birthdate !=
                                                                          null &&
                                                                      _model.birthdate !=
                                                                          ''
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .atlasBlack
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .atlasGray50,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .atlasGray50,
                                                            ),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 14.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ].divide(SizedBox(height: 40.0)),
                                  ),
                                ].divide(SizedBox(height: 40.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 50.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '¿Qué deportes practicas?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .atlasBlack,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .searchDisciplineTextController,
                                          focusNode:
                                              _model.searchDisciplineFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.searchDisciplineTextController',
                                            Duration(milliseconds: 10),
                                            () async {
                                              _model.clearDisciplineCache();
                                            },
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Buscar...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray50,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            errorStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasGray,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasPrimary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                              size: 20.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Gotham',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasBlack,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .searchDisciplineTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: _model.discipline(
                                          requestFn: () => DisciplinesGroup
                                              .findManyDisciplinesCall
                                              .call(
                                            token: FFAppState().token,
                                            search: _model
                                                .searchDisciplineTextController
                                                .text,
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
                                                runAlignment:
                                                    WrapAlignment.start,
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
                                                      if (_model.sports
                                                              .contains(
                                                                  getJsonField(
                                                            disciplinesItem,
                                                            r'''$.uuid''',
                                                          ).toString()) ==
                                                          true) {
                                                        _model.removeFromSports(
                                                            getJsonField(
                                                          disciplinesItem,
                                                          r'''$.uuid''',
                                                        ).toString());
                                                        setState(() {});
                                                      } else {
                                                        _model.addToSports(
                                                            getJsonField(
                                                          disciplinesItem,
                                                          r'''$.uuid''',
                                                        ).toString());
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.sports.contains(
                                                                      getJsonField(
                                                                    disciplinesItem,
                                                                    r'''$.uuid''',
                                                                  )
                                                                          .toString()) ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .atlasPrimary10
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasGray10,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray10,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.sports.contains(
                                                                        getJsonField(
                                                                      disciplinesItem,
                                                                      r'''$.uuid''',
                                                                    )
                                                                            .toString()) ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            14.0),
                                                        child: Text(
                                                          getJsonField(
                                                            disciplinesItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.sports.contains(
                                                                              getJsonField(
                                                                            disciplinesItem,
                                                                            r'''$.uuid''',
                                                                          )
                                                                                  .toString()) ==
                                                                          true
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasPrimary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasGray,
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
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ].divide(SizedBox(height: 40.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 50.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '¿Cuáles son tus gustos y aficiones?',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: FlutterFlowTheme.of(context)
                                              .atlasBlack,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .searchHobbiesTextController,
                                          focusNode:
                                              _model.searchHobbiesFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.searchHobbiesTextController',
                                            Duration(milliseconds: 10),
                                            () async {
                                              _model.clearDisciplineCache();
                                            },
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Buscar...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray50,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            errorStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasGray,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasPrimary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                              size: 20.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Gotham',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasBlack,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .searchHobbiesTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: _model.hobby(
                                          requestFn: () =>
                                              MemberGroup.memberMetasCall.call(
                                            filterType: 'hobby',
                                            search: _model
                                                .searchHobbiesTextController
                                                .text,
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
                                          final wrapMemberMetasResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final hobbie = getJsonField(
                                                wrapMemberMetasResponse
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
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.antiAlias,
                                                children:
                                                    List.generate(hobbie.length,
                                                        (hobbieIndex) {
                                                  final hobbieItem =
                                                      hobbie[hobbieIndex];
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
                                                              .contains(
                                                                  getJsonField(
                                                            hobbieItem,
                                                            r'''$.uuid''',
                                                          ).toString()) ==
                                                          true) {
                                                        _model
                                                            .removeFromHobbies(
                                                                getJsonField(
                                                          hobbieItem,
                                                          r'''$.uuid''',
                                                        ).toString());
                                                        setState(() {});
                                                      } else {
                                                        _model.addToHobbies(
                                                            getJsonField(
                                                          hobbieItem,
                                                          r'''$.uuid''',
                                                        ).toString());
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.hobbies.contains(
                                                                      getJsonField(
                                                                    hobbieItem,
                                                                    r'''$.uuid''',
                                                                  )
                                                                          .toString()) ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .atlasPrimary10
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasGray10,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray10,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.hobbies.contains(
                                                                        getJsonField(
                                                                      hobbieItem,
                                                                      r'''$.uuid''',
                                                                    )
                                                                            .toString()) ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            14.0),
                                                        child: Text(
                                                          getJsonField(
                                                            hobbieItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Gotham',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.hobbies.contains(
                                                                              getJsonField(
                                                                            hobbieItem,
                                                                            r'''$.uuid''',
                                                                          )
                                                                                  .toString()) ==
                                                                          true
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasPrimary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .atlasGray,
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
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ].divide(SizedBox(height: 40.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 50.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '¿A qué te dedicas?',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasBlack,
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .searchProfessionTextController,
                                          focusNode:
                                              _model.searchProfessionFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.searchProfessionTextController',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              _model.clearProfessionsCache();
                                            },
                                          ),
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Buscar...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray50,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            errorStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasGray,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasPrimary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x41FFFFFF),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                              size: 20.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Gotham',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .atlasBlack,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .searchProfessionTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: _model.professions(
                                          requestFn: () =>
                                              MemberGroup.memberMetasCall.call(
                                            filterType: 'profession',
                                            search: _model
                                                .searchProfessionTextController
                                                .text,
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
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: professions.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 12.0),
                                                itemBuilder: (context,
                                                    professionsIndex) {
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
                                                                  .atlasPrimary10
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .atlasGray10,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .atlasGray10,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.profession ==
                                                                    getJsonField(
                                                                      professionsItem,
                                                                      r'''$.uuid''',
                                                                    ).toString()
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .atlasPrimary
                                                                : FlutterFlowTheme.of(
                                                                        context)
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
                                                                    color: valueOrDefault<
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
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 40.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed('HomePage');
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed('HomePage');
                                  },
                                  child: Text(
                                    'Omitir',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          color: Color(0xBFFFFFFF),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xBFFFFFFF),
                                  size: 14.0,
                                ),
                              ].divide(SizedBox(width: 6.0)),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            if (_model.pageViewCurrentIndex == 0) {
                              _model.gender =
                                  MemberGroup.getMemberProfileCall.gender(
                                            completeProfilePageGetMemberProfileResponse
                                                .jsonBody,
                                          ) !=
                                          'null'
                                      ? MemberGroup.getMemberProfileCall.gender(
                                          completeProfilePageGetMemberProfileResponse
                                              .jsonBody,
                                        )
                                      : '';
                              _model.phone =
                                  MemberGroup.getMemberProfileCall.phone(
                                            completeProfilePageGetMemberProfileResponse
                                                .jsonBody,
                                          ) !=
                                          'null'
                                      ? MemberGroup.getMemberProfileCall.phone(
                                          completeProfilePageGetMemberProfileResponse
                                              .jsonBody,
                                        )
                                      : '';
                              _model.birthdate = MemberGroup
                                          .getMemberProfileCall
                                          .birthdate(
                                        completeProfilePageGetMemberProfileResponse
                                            .jsonBody,
                                      ) !=
                                      'null'
                                  ? MemberGroup.getMemberProfileCall.birthdate(
                                      completeProfilePageGetMemberProfileResponse
                                          .jsonBody,
                                    )
                                  : '';
                              _model.profession = getJsonField(
                                        completeProfilePageGetMemberProfileResponse
                                            .jsonBody,
                                        r'''$.profession.uuid''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      completeProfilePageGetMemberProfileResponse
                                          .jsonBody,
                                      r'''$.profession.uuid''',
                                    ).toString()
                                  : '';
                              _model.sports = (getJsonField(
                                            completeProfilePageGetMemberProfileResponse
                                                .jsonBody,
                                            r'''$.sports''',
                                          ) !=
                                          null) &&
                                      (MemberGroup.getMemberProfileCall
                                              .sports(
                                                completeProfilePageGetMemberProfileResponse
                                                    .jsonBody,
                                              )!
                                              .length >
                                          0)
                                  ? (getJsonField(
                                      completeProfilePageGetMemberProfileResponse
                                          .jsonBody,
                                      r'''$.sports[:].uuid''',
                                      true,
                                    ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                  : ([]).toList().cast<String>();
                              _model.hobbies = (getJsonField(
                                            completeProfilePageGetMemberProfileResponse
                                                .jsonBody,
                                            r'''$.hobbies''',
                                          ) !=
                                          null) &&
                                      (MemberGroup.getMemberProfileCall
                                              .hobbies(
                                                completeProfilePageGetMemberProfileResponse
                                                    .jsonBody,
                                              )!
                                              .length >
                                          0)
                                  ? (getJsonField(
                                      completeProfilePageGetMemberProfileResponse
                                          .jsonBody,
                                      r'''$.hobbies[:].uuid''',
                                      true,
                                    ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                  : ([]).toList().cast<String>();
                              setState(() {});
                              setState(() {
                                _model.phoneTextController?.text = ((MemberGroup
                                                .getMemberProfileCall
                                                .phone(
                                              completeProfilePageGetMemberProfileResponse
                                                  .jsonBody,
                                            ) !=
                                            'null') &&
                                        (MemberGroup.getMemberProfileCall.phone(
                                                  completeProfilePageGetMemberProfileResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            MemberGroup.getMemberProfileCall
                                                    .phone(
                                                  completeProfilePageGetMemberProfileResponse
                                                      .jsonBody,
                                                ) !=
                                                '')
                                    ? MemberGroup.getMemberProfileCall.phone(
                                        completeProfilePageGetMemberProfileResponse
                                            .jsonBody,
                                      )!
                                    : '');
                                _model.phoneTextController?.selection =
                                    TextSelection.collapsed(
                                        offset: _model
                                            .phoneTextController!.text.length);
                              });
                            } else if (_model.pageViewCurrentIndex == 4) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Completando tu perfil...',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).info,
                                ),
                              );
                              _model.completeProfileOutput =
                                  await MemberGroup.completeProfileCall.call(
                                token: FFAppState().token,
                                gender: _model.gender,
                                phone: _model.phone,
                                birthdate: _model.birthdate,
                                sportsList: _model.sports,
                                hobbiesList: _model.hobbies,
                                profession: _model.profession,
                              );

                              _shouldSetState = true;
                              if ((_model.completeProfileOutput?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '¡Gracias por completar tu perfil!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).success,
                                  ),
                                );
                                FFAppState().completedProfile = true;
                                FFAppState().birthdate = getJsonField(
                                  (_model.completeProfileOutput?.jsonBody ??
                                      ''),
                                  r'''$.generalInfo.birthdate''',
                                ).toString();
                                FFAppState().gender = getJsonField(
                                  (_model.completeProfileOutput?.jsonBody ??
                                      ''),
                                  r'''$.generalInfo.gender''',
                                ).toString();
                                FFAppState().phone = getJsonField(
                                  (_model.completeProfileOutput?.jsonBody ??
                                      ''),
                                  r'''$.generalInfo.phone''',
                                ).toString();
                                setState(() {});

                                context.pushNamed('HomePage');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Ha ocurrido un error...',
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
                              return;
                            }

                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            if (_shouldSetState) setState(() {});
                          },
                          child: Container(
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: Color(0x80FFFFFF),
                                  offset: Offset(
                                    -8.0,
                                    0.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 14.0, 24.0, 14.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    () {
                                      if (_model.pageViewCurrentIndex == 0) {
                                        return 'Comenzar';
                                      } else if (_model.pageViewCurrentIndex ==
                                          4) {
                                        return 'Terminar';
                                      } else {
                                        return 'Siguiente';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gotham',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.keyboard_double_arrow_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 0.0)),
            ),
          ),
        );
      },
    );
  }
}
