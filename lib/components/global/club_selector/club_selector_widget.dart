import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'club_selector_model.dart';
export 'club_selector_model.dart';

class ClubSelectorWidget extends StatefulWidget {
  const ClubSelectorWidget({super.key});

  @override
  State<ClubSelectorWidget> createState() => _ClubSelectorWidgetState();
}

class _ClubSelectorWidgetState extends State<ClubSelectorWidget> {
  late ClubSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubSelectorModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
      future: FFAppState().memberClubs(
        requestFn: () => MemberGroup.getMemberClubsCall.call(
          token: FFAppState().token,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        final clubsGetMemberClubsResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).atlasGray10,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Container(
            width: double.infinity,
            color: Color(0x00000000),
            child: ExpandableNotifier(
              controller: _model.expandableExpandableController,
              child: ExpandablePanel(
                header: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(14.0, 12.0, 4.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/atlas_imagotype.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        MemberGroup.getMemberClubsCall.name(
                          clubsGetMemberClubsResponse.jsonBody,
                        )![functions.findIndex(
                            getJsonField(
                              clubsGetMemberClubsResponse.jsonBody,
                              r'''$[:].isLast''',
                              true,
                            )!,
                            true.toString())],
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Gotham',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
                collapsed: Container(),
                expanded: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlutterFlowRadioButton(
                      options: MemberGroup.getMemberClubsCall
                          .name(
                            clubsGetMemberClubsResponse.jsonBody,
                          )!
                          .toList(),
                      onChanged: (val) async {
                        setState(() {});
                        _model.updateClubOutput =
                            await MemberGroup.updateLastClubCall.call(
                          token: FFAppState().token,
                          clubUuid: MemberGroup.getMemberClubsCall.uuid(
                            clubsGetMemberClubsResponse.jsonBody,
                          )?[functions.findIndex(
                              getJsonField(
                                clubsGetMemberClubsResponse.jsonBody,
                                r'''$[:].name''',
                                true,
                              )!,
                              _model.radioButtonValue)],
                        );

                        if ((_model.updateClubOutput?.succeeded ?? true)) {
                          FFAppState().clearMemberClubsCache();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ha ocurrido un error del servidor. Intenta más tarde.',
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
                      controller: _model.radioButtonValueController ??=
                          FormFieldController<String>(
                              MemberGroup.getMemberClubsCall.name(
                        clubsGetMemberClubsResponse.jsonBody,
                      )![functions.findIndex(
                                  getJsonField(
                                    clubsGetMemberClubsResponse.jsonBody,
                                    r'''$[:].isLast''',
                                    true,
                                  )!,
                                  'true')]),
                      optionHeight: 32.0,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Gotham',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Gotham',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ].addToStart(SizedBox(height: 6.0)),
                ),
                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: false,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
