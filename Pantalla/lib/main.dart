import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba/BotonNavigation_Bar/Inicio.dart';
import 'package:prueba/Registrarse.dart';

import 'BotonNavigation_Bar/Cuenta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'BotonNavigation_Bar/MenuInferior.dart';
import 'Constantes.dart';
import 'Cuestionario.dart';
import 'Cuestionarios.dart';
import 'GoogleInicioSesion.dart';
import 'Pregunta.dart';
import 'firebase_options.dart';

//para alinear algo a la izda : dentro de column --> crossAxisAligement: CrossAxisAligement.start

main() {
  //final List<Pregunta> preguntas2 = [];

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){

    llenarCuestionario('cuestionario_quemaduras', cuestionarioQuemaduras);
    llenarCuestionario('cuestionario_intoxicaciones', cuestionarioIntoxicaciones);
    llenarCuestionario('cuestionario_convulsiones', cuestionarioConvulsiones);
    llenarCuestionario('cuestionario_hemorragias', cuestionarioHemorragias);
    llenarCuestionario('cuestionario_fracturas', cuestionarioFracturas);

    llenarResultadosCuestionarios();

    runApp(MyApp());
  });
}

void llenarResultadosCuestionarios(){
  cuestionarios.add(Cuestionario(nombre: "Quemaduras", intentos: 0, maximaPuntuacion: 0));
  cuestionarios.add(Cuestionario(nombre: "Intoxicaciones", intentos: 0, maximaPuntuacion: 0));
  cuestionarios.add(Cuestionario(nombre: "Convulsiones", intentos: 0, maximaPuntuacion: 0));
  cuestionarios.add(Cuestionario(nombre: "Hemorragias", intentos: 0, maximaPuntuacion: 0));
  cuestionarios.add(Cuestionario(nombre: "Fracturas", intentos: 0, maximaPuntuacion: 0));

}
/*
Se meten los valores en cada pregunta del cuestionario
 */
void llenarCuestionarioValores(int valorDocumento, String coleccion, List<Pregunta> lista){
  String documento = cambiarValorDocumento(valorDocumento);

  final CollectionReference coleccionCuestionarios = FirebaseFirestore.instance.collection(coleccion);
  coleccionCuestionarios.doc(documento).get().then(
          (DocumentSnapshot doc){
        final data = doc.data() as Map<String, dynamic>;
          lista.add(Pregunta(enunciado: data["pregunta"], opciones: [data["r1"],data["r2"],data["r3"],data["r4"]], respuestaCorrecta: data["respuesta"]));
      });
}

/*
  Se meten las 5 prerguntas en la lista
 */
void llenarCuestionario(String coleccion, List<Pregunta> lista){
  llenarCuestionarioValores(0, coleccion, lista);
  llenarCuestionarioValores(1, coleccion, lista);
  llenarCuestionarioValores(2, coleccion, lista);
  llenarCuestionarioValores(3, coleccion, lista);
  llenarCuestionarioValores(4, coleccion, lista);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,//esto es lo de arriba
      ),
      home: const MyHomePage(title: NOMBRE_APP),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  var duration = const Duration(seconds: 5);
  final firebas = FirebaseFirestore.instance;

  TextEditingController contrasena = TextEditingController();
  TextEditingController email = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

     return  WillPopScope( //esta clase captura el boton para ir atras. Si es false lo ignora
          onWillPop: () async { return false; },
        child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: Text(INICIAR_SESION),
          backgroundColor: azulLogo,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60.0,),

              Text("Salud Auxiliar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 45.0,),
              Image.asset(IMAGEN_LOGO, height: 240.0,),

              SizedBox(height: 45.0,),
              iniciarSesionConGoogle(),
            ],
          ),
        ),
        )
      );
   // }
  }

  Widget iniciarSesionConGoogle() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: estiloBotonGoogle(TEXTO_BOTON_GOOGLE),
              onPressed: () async{
                await GoogleInicioSesion().iniciarSesionGoogle();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

              }
          );
        }
    );
  }

} //clase


