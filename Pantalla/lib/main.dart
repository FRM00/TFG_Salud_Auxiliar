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
import 'GoogleInicioSesion.dart';
import 'firebase_options.dart';



const String IMAGEN_LOGO = "assets/logo1.jpg";
const String IMAGEN_GOOGLE = "assets/google.png";
const String NOMBRE_APP = "Salud Auxiliar";
const String INICIAR_SESION = "Iniciar Sesión";


main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
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

    if(comprobarLogin()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
      return Scaffold();
    }else {
      return Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: Text(INICIAR_SESION),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [


              SizedBox(height: 30.0,),
              Image.asset(IMAGEN_LOGO, height: 240.0,),

              userTextField(),
              passwordTextField(),
              textoRegistrarse(),
              botonIniciarRegistrarUser("Iniciar Sesión"),
              iniciarSesionConGoogle(),
            ],
          ),
        ),
      );
    }
  }

  bool comprobarLogin(){
    bool existeLogin = false;

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        existeLogin = false;
        print('User is currently signed out!');
      } else {
        existeLogin = true;
        print('User is signed in!');
      }
    });

    return existeLogin;
  }

  Widget userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: email,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "ejemplo@gmail.com",
                labelText: "Correo Electrónico",
              ),
            ),
          );
        }
    );
  }

  Widget passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: contrasena,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "Contraseña",
                labelText: "Contraseña",
              ),
              onChanged: (value){

              },
            ),
          );
        }
    );
  }

  registroUsuario() async {
    try{
      await firebase.collection("usuarios").doc().set({
        "contrasena": contrasena.text,
        "correo": email.text
      }
      );
    }catch(e){
      print("Error al registrar usuario");
    }
  }




   Widget botonIniciarRegistrarUser(String texto) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(

                  padding: EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(texto),
                    ],
                  )
              ),

              onPressed: () {

                if(texto == "Registrar Usuario"){
                  registroUsuario();
                } else if (texto == "Iniciar Sesión"){
                  //  existeNombreUser(email.toString());
                  final au = FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: "fer88@fer.com",
                      password: "fer");
                  if (au != null){
                    print("deeeentro");

                  }else{
                    print("fueeera");

                  }
                }
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
                //mandar datos al servidor
              }
          );
        }
    );
  }

  Widget iniciarSesionConGoogle() {
    return StreamBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("       Iniciar Sesión con Gmail",),
                      Image.asset(IMAGEN_GOOGLE, height: 75,),

                    ],
                  )


              ),
              onPressed: () async{
                await GoogleInicioSesion().iniciarSesionGoogle();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

              }
          );
        }
    );
  }

  Widget textoRegistrarse() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                margin: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Registrarse()));
              }
          );
        }
    );
  }

  void comprobarExisteUsuario(){
    //metodo para comprobar si existe el usuario
    final a = firebase.collection("usuarios");
    final q = a.where("correo", isEqualTo: "p@54p.com").get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          if (docSnapshot.exists){
            print('${docSnapshot.id} => ${docSnapshot.data()}');

          }else{
            print("rrfdr");

          }
        }
      },
    );
  }





  leerDatos() async {





  }







}



