import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  image: Image.asset(
                    'assets/images/login_background.jpg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/light_logo.png',
                            width: 250.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                                controller: _model.emailTextController,
                                focusNode: _model.emailFocusNode,
                                autofocus: true,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Correo Electrónico',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: Color(0x7FFFFFFF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
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
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xBFFFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                  fillColor: Color(0x19FFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
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
                                controller: _model.passwordTextController,
                                focusNode: _model.passwordFocusNode,
                                autofocus: true,
                                textCapitalization: TextCapitalization.none,
                                obscureText: !_model.passwordVisibility,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Contraseña',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Gotham',
                                        color: Color(0x7FFFFFFF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
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
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xBFFFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                  fillColor: Color(0x19FFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.passwordVisibility =
                                          !_model.passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: _model
                                    .passwordTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Iniciando sesión...',
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
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.loginOutput =
                                    await AuthGroup.memberLoginCall.call(
                                  email: _model.emailTextController.text,
                                  password: _model.passwordTextController.text,
                                );

                                _shouldSetState = true;
                                if ((_model.loginOutput?.succeeded ?? true)) {
                                  FFAppState().uuid =
                                      AuthGroup.memberLoginCall.uuid(
                                    (_model.loginOutput?.jsonBody ?? ''),
                                  )!;
                                  FFAppState().token =
                                      AuthGroup.memberLoginCall.token(
                                    (_model.loginOutput?.jsonBody ?? ''),
                                  )!;
                                  FFAppState().name =
                                      AuthGroup.memberLoginCall.name(
                                    (_model.loginOutput?.jsonBody ?? ''),
                                  )!;
                                  FFAppState().lastName = AuthGroup
                                                  .memberLoginCall
                                                  .lastName(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          AuthGroup.memberLoginCall.lastName(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? AuthGroup.memberLoginCall.lastName(
                                          (_model.loginOutput?.jsonBody ?? ''),
                                        )!
                                      : 'null';
                                  FFAppState().email =
                                      AuthGroup.memberLoginCall.email(
                                    (_model.loginOutput?.jsonBody ?? ''),
                                  )!;
                                  FFAppState().completedProfile = getJsonField(
                                    (_model.loginOutput?.jsonBody ?? ''),
                                    r'''$.completedProfile''',
                                  );
                                  FFAppState().birthdate = AuthGroup
                                                  .memberLoginCall
                                                  .birthdate(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          AuthGroup.memberLoginCall.birthdate(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? AuthGroup.memberLoginCall.birthdate(
                                          (_model.loginOutput?.jsonBody ?? ''),
                                        )!
                                      : 'null';
                                  FFAppState().gender = AuthGroup
                                                  .memberLoginCall
                                                  .gender(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          AuthGroup.memberLoginCall.gender(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? AuthGroup.memberLoginCall.gender(
                                          (_model.loginOutput?.jsonBody ?? ''),
                                        )!
                                      : 'null';
                                  FFAppState()
                                      .phone = AuthGroup.memberLoginCall.phone(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          AuthGroup.memberLoginCall.phone(
                                                (_model.loginOutput?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? AuthGroup.memberLoginCall.phone(
                                          (_model.loginOutput?.jsonBody ?? ''),
                                        )!
                                      : 'null';
                                  FFAppState().image = getJsonField(
                                            (_model.loginOutput?.jsonBody ??
                                                ''),
                                            r'''$.image.url''',
                                          ) !=
                                          null
                                      ? getJsonField(
                                          (_model.loginOutput?.jsonBody ?? ''),
                                          r'''$.image.url''',
                                        ).toString()
                                      : 'null';
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '¡Bienvenido de nuevo!',
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
                                  if (FFAppState().completedProfile) {
                                    context.goNamed('HomePage');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    context.goNamed('CompleteProfilePage');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  if (AuthGroup.memberLoginCall.errorKey(
                                        (_model.loginOutput?.jsonBody ?? ''),
                                      ) ==
                                      'auth.credentials') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Los accesos ingresados son incorrectos',
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
                                  } else if (AuthGroup.memberLoginCall.errorKey(
                                        (_model.loginOutput?.jsonBody ?? ''),
                                      ) ==
                                      'members.noMembership') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'No existe ninguna membresía activa para este usuario',
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
                                  } else if (AuthGroup.memberLoginCall.errorKey(
                                        (_model.loginOutput?.jsonBody ?? ''),
                                      ) ==
                                      'auth.unstablishedPassword') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Debes de establecer tu contraseña primero.',
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
                                  } else if (AuthGroup.memberLoginCall.errorKey(
                                        (_model.loginOutput?.jsonBody ?? ''),
                                      ) ==
                                      'member.notActive') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tu cuenta se encuentra inactiva de momento',
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
                                  } else if ((_model.loginOutput?.statusCode ??
                                          200) ==
                                      401) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Sesión Iniciada'),
                                                  content: Text(
                                                      'Ya hay otro dispositivo con una sesión iniciada. ¿Quieres desconectar para conectar la sesión en este nuevo dispositivo?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancelar'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirmar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Iniciando sesión...',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      );
                                      _model.forceLoginOutput =
                                          await AuthGroup.memberLoginCall.call(
                                        email: _model.emailTextController.text,
                                        password:
                                            _model.passwordTextController.text,
                                        force: true,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.forceLoginOutput?.succeeded ??
                                          true)) {
                                        FFAppState().uuid =
                                            AuthGroup.memberLoginCall.uuid(
                                          (_model.forceLoginOutput?.jsonBody ??
                                              ''),
                                        )!;
                                        FFAppState().token =
                                            AuthGroup.memberLoginCall.token(
                                          (_model.forceLoginOutput?.jsonBody ??
                                              ''),
                                        )!;
                                        FFAppState().name =
                                            AuthGroup.memberLoginCall.name(
                                          (_model.forceLoginOutput?.jsonBody ??
                                              ''),
                                        )!;
                                        FFAppState().lastName =
                                            AuthGroup.memberLoginCall.lastName(
                                                          (_model.forceLoginOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    AuthGroup.memberLoginCall
                                                            .lastName(
                                                          (_model.forceLoginOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        ''
                                                ? AuthGroup.memberLoginCall
                                                    .lastName(
                                                    (_model.forceLoginOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                : 'null';
                                        FFAppState().email =
                                            AuthGroup.memberLoginCall.email(
                                          (_model.forceLoginOutput?.jsonBody ??
                                              ''),
                                        )!;
                                        FFAppState().completedProfile =
                                            AuthGroup.memberLoginCall
                                                .completedProfile(
                                          (_model.forceLoginOutput?.jsonBody ??
                                              ''),
                                        )!;
                                        FFAppState().birthdate =
                                            AuthGroup.memberLoginCall.birthdate(
                                                          (_model.forceLoginOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    AuthGroup.memberLoginCall
                                                            .birthdate(
                                                          (_model.forceLoginOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        ''
                                                ? AuthGroup.memberLoginCall
                                                    .birthdate(
                                                    (_model.forceLoginOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                : 'null';
                                        FFAppState().gender = AuthGroup
                                                        .memberLoginCall
                                                        .gender(
                                                      (_model.forceLoginOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null &&
                                                AuthGroup.memberLoginCall
                                                        .gender(
                                                      (_model.forceLoginOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    ''
                                            ? AuthGroup.memberLoginCall.gender(
                                                (_model.forceLoginOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                            : 'null';
                                        FFAppState().phone = AuthGroup
                                                        .memberLoginCall
                                                        .phone(
                                                      (_model.forceLoginOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null &&
                                                AuthGroup.memberLoginCall.phone(
                                                      (_model.forceLoginOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    ''
                                            ? AuthGroup.memberLoginCall.phone(
                                                (_model.forceLoginOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                            : 'null';
                                        FFAppState().image = getJsonField(
                                                  (_model.forceLoginOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.image.url''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.forceLoginOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.image.url''',
                                              ).toString()
                                            : 'null';
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '¡Bienvenido de nuevo!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                          ),
                                        );
                                        if (FFAppState().completedProfile) {
                                          context.goNamed('HomePage');

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          context
                                              .goNamed('CompleteProfilePage');

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Ha ocurrido un error desconocido. Contacta a soporte para reportar este error.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
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
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Ha ocurrido un error desconocido. Contacta a soporte para reportar este error.',
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  setState(() {
                                    _model.emailTextController?.clear();
                                    _model.passwordTextController?.clear();
                                  });
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Iniciar Sesión',
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
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ForgotPasswordPage');
                              },
                              child: Text(
                                'Si es tu primer inicio de sesión, haz click en establecer mi contraseña para activar tu cuenta.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ForgotPasswordPage');
                              },
                              child: Text(
                                'Olvidé / Establecer mi Contraseña',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
