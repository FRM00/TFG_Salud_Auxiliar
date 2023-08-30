import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//carpeta raiz
const String IMAGEN_LOGO = "assets/logo_sin_fondo.png";
const String IMAGEN_GOOGLE = "assets/google.png";
const String IMAGEN_RCP = "assets/rcp.png";

//Quemaduras
const String IMAGEN_PROFUNDIDAD_QUEMADURAS = "assets/Quemaduras/profundidadQuemaduras.png";
const String IMAGEN_QUEMADURA_1 = "assets/Quemaduras/quemadura1.png";
const String IMAGEN_QUEMADURA_ELECTRICA = "assets/Quemaduras/quemadurasElectricasEjemplo.png";
const String IMAGEN_QUEMADURA_ELECTRICA_QUE_HACER = "assets/Quemaduras/quemadurasElectricasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_HACER = "assets/Quemaduras/quemadurtasQueHacer.png";
const String IMAGEN_QUEMADURA_QUE_NO_HACER = "assets/Quemaduras/quemadurtasQueNOHacer.png";
const String IMAGEN_QUEMADURA_QUIMICA_QUE_HACER = "assets/Quemaduras/quemadurasQuimicasQueHacer.png";
const String IMAGEN_QUEMADURA_SOLAR_PREVENIR = "assets/Quemaduras/quemadurasSolaresPrevenir.png";

//Intoxicaciones
const String IMAGEN_INTOXICACION_HUMO = "assets/Intoxicaciones/humo.png";
const String IMAGEN_INTOXICACION_ALCOHOL_QUE_HACER = "assets/Intoxicaciones/intoxicacionAlcoholQueHacer.png";
const String IMAGEN_INTOXICACION_PIEL_QUE_HACER = "assets/Intoxicaciones/intoxicacionesPielQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_CIRCULATORIA_QUE_HACER = "assets/Intoxicaciones/intoxicacionesViaCirculatoriaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_HACER = "assets/Intoxicaciones/intoxicacionesViaDigestivaQueHacer.png";
const String IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_NO_HACER = "assets/Intoxicaciones/intoxicacionesViaDigestivaQueNOHacer.png";
const String IMAGEN_INTOXICACION_VIA_RESPIRATORIA_QUE_HACER = "assets/Intoxicaciones/intoxicacionesViaRespiratoriaQueHacer.png";
const String IMAGEN_INTOXICACION_MONOXIDO_CARBONO = "assets/Intoxicaciones/monoxidoDeCarbono.png";


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
  return Text(texto,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: 15,
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



