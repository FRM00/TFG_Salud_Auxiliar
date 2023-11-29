/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'BotonNavigation_Bar/Cuenta.dart';
import 'Buscador.dart';
import 'Cuestionario.dart';
import 'Cuestionarios.dart';
import 'Pregunta.dart';
import 'main.dart';
                        //FOTOS
//carpeta raiz
const String IMAGEN_LOGO = "assets/logo_sin_fondo.png";
const String IMAGEN_GOOGLE = "assets/google.png";
const String IMAGEN_RCP = "assets/rcp.png";
const String IMAGEN_LOGO_QUEMADURAS = "assets/logoQuemaduras.png";
const String IMAGEN_LOGO_HEMORRAGIAS = "assets/logoHemorragia.png";
const String IMAGEN_LOGO_FRACTURAS = "assets/logoFractura.png";
const String IMAGEN_LOGO_CONVULSIONES = "assets/logoConvulsion.png";
const String IMAGEN_LOGO_INTOXICACIONES = "assets/logoIntoxicacion.png";


//Quemaduras
const String IMAGEN_PROFUNDIDAD_QUEMADURAS = "assets/profundidadQuemaduras.png";
const String IMAGEN_QUEMADURA_1 = "assets/quemadura1.png";
const String IMAGEN_QUEMADURA_ELECTRICA = "assets/quemadurasElectricasEjemplo.png";
const String IMAGEN_QUEMADURA_ELECTRICA_QUE_HACER = "assets/quemadurasElectricasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_HACER = "assets/quemadurtasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_NO_HACER = "assets/quemadurtasQueNOHacer.png";
const String IMAGEN_QUEMADURA_QUIMICA_QUE_HACER = "assets/quemadurasQuimicasQueHacer.png";
const String IMAGEN_QUEMADURA_SOLAR_PREVENIR = "assets/quemadurasSolaresPrevenir.png";
const String MENSAJE_ALERTA_CUESTIONARIOS = 'Se ha seleccionado más de una opción por pregunta o falta alguna de contestar';
//Intoxicaciones
const String IMAGEN_INTOXICACION_HUMO = "assets/humo.png";
const String IMAGEN_INTOXICACION_ALCOHOL_QUE_HACER = "assets/intoxicacionAlcoholQueHacer.png";
const String IMAGEN_INTOXICACION_PIEL_QUE_HACER = "assets/intoxicacionesPielQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_CIRCULATORIA_QUE_HACER = "assets/intoxicacionesViaCirculatoriaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_HACER = "assets/intoxicacionesViaDigestivaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_NO_HACER = "assets/intoxicacionesViaDigestivaQueNOHacer.png";
const String IMAGEN_INTOXICACION_VIA_RESPIRATORIA_QUE_HACER = "assets/intoxicacionesViaRespiratoriaQueHacer.png";
const String IMAGEN_INTOXICACION_MONOXIDO_CARBONO = "assets/monoxidoDeCarbono.png";
//Convulsiones
const String IMAGEN_CONVULSIONES_QUE_HACER = "assets/convulsionesQueHacer.png";
const String IMAGEN_CONVULSIONES_QUE_NO_HACER = "assets/convulsionesQueNOHacer.png";
//const String IMAGEN_CONVULSIONES_CAUSAS = "assets/convulsionesCausas.png";

//Hemorragias
const String IMAGEN_HEMORRAGIAS_QUE_NO_HACER = "assets/hemorragiasQueNOHacer.png";
const String IMAGEN_HEMORRAGIAS_QUE_HACER = "assets/hemorragiasQueHacer.png";
const String IMAGEN_HEMORRAGIAS_INTERNAS_QUE_HACER = "assets/hemorragiasInternasQueHacer.png";
const String IMAGEN_HEMORRAGIAS_NARIZ = "assets/hemorragiaNariz.png";
const String IMAGEN_HEMORRAGIAS_CLASIFICACION = "assets/hemorragiaClasificacion.png";
const String IMAGEN_HEMORRAGIAS_TORNIQUETE = "assets/torniquete.png";

//Fracturas
const String IMAGEN_FRACTURAS_QUE_HACER = "assets/fracturasQueHacer.png";
const String IMAGEN_FRACTURAS_QUE_NO_HACER = "assets/fracturasQueNOHacer.png";

                      //OTRAS CONSTANTES
const String NOMBRE_APP = "Salud Auxiliar";
const String INICIAR_SESION = "Iniciar Sesión";
const String TEXTO_BOTON_GOOGLE = "Iniciar Sesión";
const String REGISTRARSE = "Registrar Usuario";
const String NOMBRE_USER = "Nombre de Usuario: ";
const String CORREO_ELECTRONICO = "Su correo: ";
const String CONTRASENA = "Ingrese su contraseña: ";
const String CAMBIAR_CONTRASENA = "Nueva contraseña: ";
const String REPETIR_CONTRASENA = "Repita la nueva contraseña: ";
                      //COLECCIONES Y DOCUMENTOS
const String COLECCION_DETALLES = "detalles";
const String COLECCION_AVISO_LEGAL = "aviso_legal";
const String DOCUMENTO_BD_AVISO_LEGAL = "informacion";
const String DOCUMENTO_BD_QUEMADURAS = "quemaduras";
const String DOCUMENTO_BD_QUEMADURAS_ELECTRICAS = "quemadurasElectricas";
const String DOCUMENTO_BD_QUEMADURAS_QUIMICAS = "quemadurasQuimicas";
const String DOCUMENTO_BD_INTOXICACIONES = "intoxicaciones";
const String DOCUMENTO_BD_CONVULSIONES = "convulsiones";
const String DOCUMENTO_BD_HEMORRAGIAS = "hemorragias";
const String DOCUMENTO_BD_FRACTURAS = "fracturas";


                      //VARIABLES
late Map<String, dynamic> documentoBD; //variable para iterar.  es un documento de una coleccion.
final List<Pregunta> cuestionarioQuemaduras = [];
final List<Pregunta> cuestionarioIntoxicaciones = [];
final List<Pregunta> cuestionarioConvulsiones = [];
final List<Pregunta> cuestionarioHemorragias = [];
final List<Pregunta> cuestionarioFracturas = [];

final List<Cuestionario> cuestionarios = [];


                      //COLORES
const Color azulLogo = Color.fromARGB(1000, 0, 154, 208);

                    //FUNCIONES
Widget estiloBoton(String texto) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: azulLogo,

    ),
    padding: EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(texto,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 17, ))
      ],
    ),
  );
}

Widget estiloBotonHueco(String texto){
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: azulLogo),
        borderRadius: BorderRadius.circular(10)

    ),
    padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0, ),
    child: Text(texto,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22, color: azulLogo, ),
    ),
  );
}

Widget estiloBotonGoogle(String texto){
  return Container(
      decoration: BoxDecoration(
          border: Border.all(color: azulLogo),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(texto,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22,
              color: azulLogo,
              fontWeight: FontWeight.bold,
            ),
          ),

          Image.asset(IMAGEN_GOOGLE, height: 100,),
        ],
      )
  );
}

Widget estiloExplicacionDetalles(String variable){
  return Text(variable,
    textAlign: TextAlign.justify,
    overflow: TextOverflow.fade,
    style: TextStyle(
        fontSize: 17,
      ),
  );
}

Widget estiloTituloDetalles(String texto){
  return Text(texto,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget estiloSubTitulos(String texto){
  return Text(texto,
    textAlign: TextAlign.left,

    style: TextStyle(
      fontSize: 18,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
    ),

  );
}

Widget zoomImagen(String nombreImagen){
  return InteractiveViewer(
      child: Stack(
        children: [
          Hero(
            tag: "",
            child: Image.asset(nombreImagen, height: 250.0,),)
        ],
      )
  );
}

void consultaLista(){
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('cuestionario_quemaduras')
      .doc("pregunta1");

  FirebaseFirestore.instance.runTransaction((transaction) async {
    // Get the document
    DocumentSnapshot snapshot = await transaction.get(documentReference);

    if (!snapshot.exists) {
      throw Exception("User does not exist!");
    }else{
      print("nuevoooo");
      print(snapshot.data());
    }

    // Update the follower count based on the current count
    // Note: this could be done without a transaction
    // by updating the population using FieldValue.increment()

    //int newFollowerCount = snapshot.data()?['cuestionario_quemaduras'] + 1;

    // Perform an update on the document
    //transaction.update(documentReference, {'followers': newFollowerCount});

    // Return the new count
    // return newFollowerCount;
  })
      .then((value) => print("Follower count updated to $value"))
      .catchError((error) => print("Failed to update user followers: $error"));
}


FutureBuilder<DocumentSnapshot> consulta(String coleccion, String documento, String campo) {
  final CollectionReference coleccionConsulta = FirebaseFirestore.instance.collection(coleccion);

  /*
  String campo = cambiarValorCampo(valorCampo);
  String documento = cambiarValorDocumento(valorDocumento);
*/
  return FutureBuilder<DocumentSnapshot>(
    future: coleccionConsulta.doc(documento).get(),
    builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }
      if (snapshot.hasData && !snapshot.data!.exists) {
        return Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

        return Text("${data[campo]}", textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 15,
          ),
        );
      }
      return Column();

    },
  );
}

String cambiarValorCampo(int valorCampo) {
  String campo = "";

  if(valorCampo == 0){
    campo = "pregunta";
  }else if(valorCampo == 1){
    campo = "r1";
  }else if(valorCampo == 2){
    campo = "r2";
  }else if(valorCampo == 3){
    campo = "r3";
  }else if(valorCampo == 4){
    campo = "r4";
  }else if(valorCampo == 5){
    campo = "respuesta";
  }
  return campo;
}

String cambiarValorDocumento(int valorCampo) {
  String campo = "";

  if(valorCampo == 0){
    campo = "pregunta1";
  }else if(valorCampo == 1){
    campo = "pregunta2";
  }else if(valorCampo == 2){
    campo = "pregunta3";
  }else if(valorCampo == 3){
    campo = "pregunta4";
  }else if(valorCampo == 4){
    campo = "pregunta5";
  }
  return campo;
}

Widget filaItemize(String texto){
  return Row(
    children: [
      Icon(Icons.arrow_right, ),

  Container(
    width: 300,
    height: 40,
    child:
      Text(texto,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
  ),
    ],
  );
}

AppBar appBarPantallas(BuildContext context, String user){
  return AppBar(
    title: Text(user),
    backgroundColor: azulLogo,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () async {
          await showSearch(
              context: context,
              delegate: CustomSearchClass()
          );
        },
      ),
    ],
  );
}





