import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

//carpeta raiz
const String IMAGEN_LOGO = "assets/logo_sin_fondo.png";
const String IMAGEN_GOOGLE = "assets/google.png";
const String IMAGEN_RCP = "assets/rcp.png";

//Quemaduras
const String IMAGEN_PROFUNDIDAD_QUEMADURAS = "assets/profundidadQuemaduras.png";
const String IMAGEN_QUEMADURA_1 = "assets/quemadura1.png";
const String IMAGEN_QUEMADURA_ELECTRICA = "assets/quemadurasElectricasEjemplo.png";
const String IMAGEN_QUEMADURA_ELECTRICA_QUE_HACER = "assets/quemadurasElectricasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_HACER = "assets/quemadurtasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_NO_HACER = "assets/quemadurtasQueNOHacer.png";
const String IMAGEN_QUEMADURA_QUIMICA_QUE_HACER = "assets/quemadurasQuimicasQueHacer.png";
const String IMAGEN_QUEMADURA_SOLAR_PREVENIR = "assets/quemadurasSolaresPrevenir.png";

//Intoxicaciones
const String IMAGEN_INTOXICACION_HUMO = "assets/humo.png";
const String IMAGEN_INTOXICACION_ALCOHOL_QUE_HACER = "assets/intoxicacionAlcoholQueHacer.png";
const String IMAGEN_INTOXICACION_PIEL_QUE_HACER = "assets/intoxicacionesPielQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_CIRCULATORIA_QUE_HACER = "assets/intoxicacionesViaCirculatoriaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_HACER = "assets/intoxicacionesViaDigestivaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_NO_HACER = "assets/intoxicacionesViaDigestivaQueNOHacer.png";
const String IMAGEN_INTOXICACION_VIA_RESPIRATORIA_QUE_HACER = "assets/intoxicacionesViaRespiratoriaQueHacer.png";
const String IMAGEN_INTOXICACION_MONOXIDO_CARBONO = "assets/monoxidoDeCarbono.png";


//const String IMAGEN_ = "";


const String NOMBRE_APP = "Salud Auxiliar";
const String INICIAR_SESION = "Iniciar Sesión";
const String TEXTO_BOTON_GOOGLE = "       Iniciar Sesión con Gmail";
const String REGISTRARSE = "Registrar Usuario";
const String NOMBRE_USER = "Nombre de Usuario: ";
const String CORREO_ELECTRONICO = "Su correo electrónico: ";
const String CONTRASENA = "Ingrese su contraseña: ";
const String CAMBIAR_CONTRASENA = "Nueva contraseña: ";
const String REPETIR_CONTRASENA = "Repita la nueva contraseña: ";
const String COLECCION_DETALLES = "detalles";
const String DOCUMENTO_BD_QUEMADURAS = "quemaduras";

const Color azulLogo = Color.fromARGB(1000, 0, 154, 208);


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
        Text(texto),
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
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(texto),
          Image.asset(IMAGEN_GOOGLE, height: 75,),
        ],
      )
  );
}
Widget estiloExplicacionDetalles(String texto){
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Text(texto,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 15,
      ),
    ),
  );

}

Widget estiloTituloDetalles(String texto){
  return Text(texto,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}

String getBaseDatos(String coleccion, String nombreCampo){
  print("esdrtgsdfg");

  final coleccionUsuarios = FirebaseFirestore.instance.collection(coleccion);
    String resultado = "";
    coleccionUsuarios.get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        print("dentro del for eachhchchch");

        print(doc[nombreCampo]);
        resultado = doc[nombreCampo];
      }),
  });

  return resultado;
}
/*
Metodo para los detalles
 */
void getDetallesBaseDatos(String coleccion, String documento, String nombreCampo){
  String valor = "";
print("coleccion" + coleccion);
  print("documento" + documento);
  print("campo" + nombreCampo);

  final doc = FirebaseFirestore.instance.collection(coleccion).doc(documento);
  doc.get().then(
        (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print("dentro del for");

      aa = data[nombreCampo];
      print("valor " + valor);
    },
    onError: (e) => print("Error getting document: $e"),
  );

  //return valor;
}

Widget escribirPantalla(String coleccion, String documento, String nombreCampo){
  //String textoBD = getDetallesBaseDatos(coleccion, documento, nombreCampo);

  print("textodb essss;");
  //print(textoBD);
  return Text("textoBD",
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: 15,
    ),
  );
}


Widget zoomImagen(String nombreImagen){
  return InteractiveViewer(
      child: Stack(
        children: [
          Hero(
            tag: "",
            child: Image.asset(nombreImagen, height: 180.0,),)
        ],
      )
  );
}









