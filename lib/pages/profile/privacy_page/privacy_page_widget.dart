import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_page_model.dart';
export 'privacy_page_model.dart';

class PrivacyPageWidget extends StatefulWidget {
  const PrivacyPageWidget({super.key});

  @override
  State<PrivacyPageWidget> createState() => _PrivacyPageWidgetState();
}

class _PrivacyPageWidgetState extends State<PrivacyPageWidget> {
  late PrivacyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Aviso de Privacidad',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Cumpliendo con lo establecido en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP); ATLAS COLOMOS, A.C.; le da a conocer el presente Aviso de Privacidad, mismo que aplica a los datos personales recabados con pleno consentimiento de su Titular y mediante el cual le informa el tratamiento/uso que se dará a los mismos.\n\nCon fundamento en los artículos 15 y 16 de la Ley Federal de Protección de Datos Personales en Posesión de Particulares hacemos de su conocimiento que ATLAS COLOMOS, AC, con domicilio en Paseo Atlas Colomos número 2000, Colonia Lomas del Bosque, Zapopan, Jalisco, C. P. 45118, es responsable de recabar sus datos personales, del uso que se le dé a los mismos y de su protección.\n\nSu información personal será utilizada con la finalidad de brindarle el servicio integral del Club, proveer los servicios y productos que solicite, notificarle sobre nuevos servicios o productos que tengan relación con los ya contratados o adquiridos, comunicarle sobre cambios en los mismos, elaborar estudios y programas que son necesarios para determinar hábitos de consumo, realizar evaluaciones periódicas de nuestros productos y servicios a efecto de mejorar la calidad de los mismos, evaluar la calidad del servicio que brindamos, envío de comunicaciones, atender quejas y aclaraciones, y en su caso, tratarlos para fines compatibles con los mencionados en este Aviso de Privacidad y que se consideren análogos para efectos legales y en general para dar cumplimiento a las obligaciones que hemos contraído con usted.\n\nPara las finalidades antes mencionadas, requerimos obtener los siguientes Datos Personales:\n\nNOMBRE, DOMICILIO PARTICULAR Y DE TRABAJO, TELFONO PARTICULAR, MOVIL Y DE TRABAJO, DIRECCION DE CORREO ELECTRÓNICO, NACIONALIDAD, GRADO DE ESCOLARIDAD, REFERENCIAS PERSONALES Y ESTADO CIVIL PRINCIPALMENTE.\n\nAdemás de lo anterior, ATLAS COLOMOS, A.C. recaba Datos Personales Sensibles como el ESTADO DE SALUD actual.\n\nRECOLECCION DE DATOS PERSONALES. El Responsable puede solicitar los Datos Personales del Titular mediante su identificación (Credencial de Elector, Pasaporte, Licencia de Conducir, Cartilla de Identidad Personal del SMN), Fotografías, formatos proporcionados por la Institución para efecto de inscripciones, Acta de Nacimiento, Acta de Matrimonio, CURP, Comprobantes de domicilio, Currículum Vitae y constancias médicas, principalmente.\n\nLos datos podrán ser transferidos a empresas filiales, subsidiarias y/o relacionadas, para las finalidades descritas en el presente Aviso de Privacidad. Se entiende por las anteriores, el grupo de asociaciones civiles Atlas que hoy existen y del cual forma parte la Responsable, esto es, Atlas Colomos, A. C., Club Atlas Chapalita, A. C., y Atlas Country Club, A. C.\n\nEn caso de que no obtengamos su oposición expresa para que sus datos personales sean transferidos en la forma y términos antes descrita, entenderemos que ha otorgado su consentimiento en forma tácita para ello.\n\nLos Datos serán tratados de conformidad con la Ley Federal de Protección de Datos Personales en Posesión de los Particulares y su Reglamento. La confidencialidad de los Datos está garantizada y los mismos están protegidos por medidas de seguridad administrativas, técnicas y físicas, para evitar su daño, pérdida, alteración, destrucción, uso, acceso o divulgación indebida. Únicamente las personas autorizadas tendrán acceso a sus Datos.\n\nUsted tiene derecho al Acceso, Rectificación y Cancelación de sus datos personales, a Oponerse al tratamiento de los mismos o a revocar el consentimiento que para dicho fin nos haya otorgado.\n\nPara ello, es necesario que envíe la solicitud en los términos que marca la Ley en su Art. 29 al Lic. Jesús Valdivia y/o Ing. Antonio Rentería responsables de nuestro Departamento de Protección de Datos Personales, ubicado en Paseo Atlas Colomos número 2000, Colonia Lomas del Bosque, Zapopan, Jalisco, C. P. 45118, o bien, se comunique a los teléfonos 01 33 3648 0120 o vía correo electrónico privacidad@atlas.com.mx el cual solicitamos confirme vía telefónica para garantizar su correcta recepción. En caso de que no desee de recibir mensajes promocionales de nuestra parte, puede enviarnos su solicitud por medio de la dirección electrónica: privacidad@atlas.com.mx Importante.\n\nEn caso de existir alguna modificación al presente Aviso de Privacidad se hará de su conocimiento en nuestro sitio de Internet http://www.atlas.com.mx/ sección política de privacidad',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Gotham',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.5,
                          ),
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
