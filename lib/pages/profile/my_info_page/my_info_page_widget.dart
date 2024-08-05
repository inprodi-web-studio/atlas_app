import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'my_info_page_model.dart';
export 'my_info_page_model.dart';

class MyInfoPageWidget extends StatefulWidget {
  const MyInfoPageWidget({super.key});

  @override
  State<MyInfoPageWidget> createState() => _MyInfoPageWidgetState();
}

class _MyInfoPageWidgetState extends State<MyInfoPageWidget> {
  late MyInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyInfoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.gender = FFAppState().gender;
      _model.birthdate = FFAppState().birthdate;
      setState(() {});
    });

    _model.nameTextController ??=
        TextEditingController(text: FFAppState().name);
    _model.nameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController(
        text: (FFAppState().lastName != null && FFAppState().lastName != '') &&
                (FFAppState().lastName != 'null')
            ? FFAppState().lastName
            : '');
    _model.lastNameFocusNode ??= FocusNode();

    _model.emailTextController ??=
        TextEditingController(text: FFAppState().email);
    _model.emailFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController(
        text: (FFAppState().phone != null && FFAppState().phone != '') &&
                (FFAppState().phone != 'null')
            ? FFAppState().phone
            : '');
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
              context.safePop();
            },
          ),
          title: Text(
            'Mi Información',
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if ((FFAppState().image == null ||
                          FFAppState().image == '') ||
                      (FFAppState().image == 'null'))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                          pickerFontFamily: 'Roboto',
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Subiendo imagen...',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 11.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).info,
                          ),
                        );
                        _model.loading = true;
                        setState(() {});
                        _model.uploadedOutput =
                            await MemberGroup.uploadProfileImageCall.call(
                          image: _model.uploadedLocalFile,
                          token: FFAppState().token,
                        );

                        if ((_model.uploadedOutput?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Imagen subida correctamente',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).success,
                            ),
                          );
                          _model.loading = false;
                          setState(() {});
                          FFAppState().image = getJsonField(
                            (_model.uploadedOutput?.jsonBody ?? ''),
                            r'''$.generalInfo.image.url''',
                          ).toString();
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ha ocurrido un error al subir la imagen.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 11.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).customColor1,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!_model.loading)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 45.0,
                                ),
                              ),
                            if (_model.loading)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Lottie.network(
                                  'https://lottie.host/29e39a50-b968-4451-97f8-8aba382a4816/LpwUShz1hB.json',
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if ((FFAppState().image != null &&
                          FFAppState().image != '') &&
                      (FFAppState().image != 'null'))
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).customColor1,
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000.0),
                              child: Image.network(
                                '${FFAppConstants.apiUrl}/public${FFAppState().image}',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 30.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 14.0,
                              ),
                              onPressed: () async {
                                var _shouldSetState = false;
                                FFAppState().image = '';
                                setState(() {});
                                _model.removeOutput = await MemberGroup
                                    .removeProfileImageCall
                                    .call(
                                  token: FFAppState().token,
                                );

                                _shouldSetState = true;
                                if ((_model.removeOutput?.succeeded ?? true)) {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Ocurrió un error al eliminar la imagen...',
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
                                if (_shouldSetState) setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.nameTextController,
                                focusNode: _model.nameFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasGray50,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Nombre(s)',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasPrimary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).atlasGray,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: FlutterFlowTheme.of(context)
                                          .atlasBlack,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                validator: _model.nameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.lastNameTextController,
                                focusNode: _model.lastNameFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasGray50,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Apellidos',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasPrimary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).atlasGray,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: FlutterFlowTheme.of(context)
                                          .atlasBlack,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                validator: _model
                                    .lastNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.emailTextController,
                                focusNode: _model.emailFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasGray50,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Correo Electrónico',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasPrimary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color:
                                        FlutterFlowTheme.of(context).atlasGray,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: FlutterFlowTheme.of(context)
                                          .atlasBlack,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: _model.emailTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.phoneTextController,
                                focusNode: _model.phoneFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasGray50,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Teléfono',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasGray,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .atlasPrimary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x41FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.phone_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).atlasGray,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: FlutterFlowTheme.of(context)
                                          .atlasBlack,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.number,
                                validator: _model.phoneTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.phoneMask],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fecha de Nacimiento',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasBlack75,
                                        fontSize: 14.0,
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
                                      initialDate: functions.dateStringToDate(
                                          FFAppState().birthdate != 'null'
                                              ? FFAppState().birthdate
                                              : '1997-01-01'),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Gotham',
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                  ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
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
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .atlasGray,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 16.0, 10.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: FlutterFlowTheme.of(context)
                                                .atlasGray,
                                            size: 20.0,
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              (_model.birthdate != null &&
                                                          _model.birthdate !=
                                                              '') &&
                                                      (_model.birthdate !=
                                                          'null')
                                                  ? _model.birthdate
                                                  : 'dd - mm - yyyy',
                                              'dd - mm - yyyy',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gotham',
                                                  color: valueOrDefault<Color>(
                                                    (_model.birthdate != null &&
                                                                _model.birthdate !=
                                                                    '') &&
                                                            (_model.birthdate !=
                                                                'null')
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .atlasGray50,
                                                    FlutterFlowTheme.of(context)
                                                        .atlasGray50,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 14.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Género',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: FlutterFlowTheme.of(context)
                                            .atlasBlack75,
                                        fontSize: 14.0,
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.gender = 'male';
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .atlasGray10,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.gender == 'male'
                                                  ? FlutterFlowTheme.of(context)
                                                      .atlasPrimary
                                                  : FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              FlutterFlowTheme.of(context)
                                                  .customColor1,
                                            ),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.male_rounded,
                                                color: valueOrDefault<Color>(
                                                  _model.gender == 'male'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .atlasPrimary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .atlasGray,
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                                ),
                                                size: 20.0,
                                              ),
                                              Text(
                                                'Masculino',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Gotham',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.gender == 'male'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .atlasPrimary
                                                            : FlutterFlowTheme
                                                                    .of(context)
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
                                                      lineHeight: 1.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.gender = 'female';
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .atlasGray10,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.gender == 'female'
                                                  ? FlutterFlowTheme.of(context)
                                                      .atlasPrimary
                                                  : FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              FlutterFlowTheme.of(context)
                                                  .customColor1,
                                            ),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.female_rounded,
                                                color: valueOrDefault<Color>(
                                                  _model.gender == 'female'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .atlasPrimary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .atlasGray,
                                                  FlutterFlowTheme.of(context)
                                                      .atlasGray,
                                                ),
                                                size: 20.0,
                                              ),
                                              Text(
                                                'Femenino',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gotham',
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
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                            FFButtonWidget(
                              onPressed: ((_model.nameTextController.text ==
                                              null ||
                                          _model
                                                  .nameTextController.text ==
                                              '') ||
                                      (_model.lastNameTextController.text ==
                                              null ||
                                          _model.lastNameTextController.text ==
                                              '') ||
                                      (_model.emailTextController.text ==
                                              null ||
                                          _model.emailTextController.text ==
                                              '') ||
                                      (_model.phoneTextController.text ==
                                              null ||
                                          _model.phoneTextController.text ==
                                              '') ||
                                      ((_model.birthdate == null ||
                                              _model.birthdate == '') ||
                                          (_model.birthdate == 'null')) ||
                                      ((_model.gender == null ||
                                              _model.gender == '') ||
                                          (_model.gender == 'null')))
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      if ((_model
                                                      .nameTextController.text !=
                                                  null &&
                                              _model.nameTextController
                                                      .text !=
                                                  '') &&
                                          (_model.lastNameTextController
                                                      .text !=
                                                  null &&
                                              _model.lastNameTextController
                                                      .text !=
                                                  '') &&
                                          (_model.emailTextController
                                                      .text !=
                                                  null &&
                                              _model.emailTextController
                                                      .text !=
                                                  '') &&
                                          (_model.phoneTextController.text !=
                                                  null &&
                                              _model.phoneTextController.text !=
                                                  '') &&
                                          (_model.gender != null &&
                                              _model.gender != '') &&
                                          (_model.birthdate != null &&
                                              _model.birthdate != '')) {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.updateOutput = await MemberGroup
                                            .updateProfileCall
                                            .call(
                                          name: _model.nameTextController.text,
                                          lastName: _model
                                              .lastNameTextController.text,
                                          email:
                                              _model.emailTextController.text,
                                          phone:
                                              _model.phoneTextController.text,
                                          gender: _model.gender,
                                          birthdate: _model.birthdate,
                                          token: FFAppState().token,
                                        );

                                        _shouldSetState = true;
                                        if ((_model.updateOutput?.succeeded ??
                                            true)) {
                                          FFAppState().name = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.name''',
                                          ).toString();
                                          FFAppState().lastName = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.lastName''',
                                          ).toString();
                                          FFAppState().email = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.email''',
                                          ).toString();
                                          FFAppState().birthdate = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.birthdate''',
                                          ).toString();
                                          FFAppState().gender = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.gender''',
                                          ).toString();
                                          FFAppState().phone = getJsonField(
                                            (_model.updateOutput?.jsonBody ??
                                                ''),
                                            r'''$.generalInfo.phone''',
                                          ).toString();
                                          setState(() {});

                                          context.goNamed(
                                            'ProfilePage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );

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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error desconocido... intenta más tarde.',
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
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
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                                borderRadius: BorderRadius.circular(14.0),
                                disabledColor: Color(0x7EEE3524),
                              ),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
