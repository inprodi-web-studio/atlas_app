import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_slots_empty_model.dart';
export 'no_slots_empty_model.dart';

class NoSlotsEmptyWidget extends StatefulWidget {
  const NoSlotsEmptyWidget({super.key});

  @override
  State<NoSlotsEmptyWidget> createState() => _NoSlotsEmptyWidgetState();
}

class _NoSlotsEmptyWidgetState extends State<NoSlotsEmptyWidget> {
  late NoSlotsEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoSlotsEmptyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'No se encontró ningún espacio disponible',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Gotham',
                    color: FlutterFlowTheme.of(context).atlasGray,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
