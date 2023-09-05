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
import 'GoogleInicioSesion.dart';
import 'firebase_options.dart';


String aa = "";

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
    getDetallesBaseDatos("detalles","quemaduras", "consiste");
    if(comprobarLogin()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
      return WillPopScope( //esta clase captura el boton para ir atras. Si es false lo ignora
        onWillPop: () async {
          return false;
        }, child: Scaffold(),
      );
    }else {
      return  WillPopScope( //esta clase captura el boton para ir atras. Si es false lo ignora
          onWillPop: () async {
        return false;
      },
        child: Scaffold(
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
              botonIniciarSesion("Iniciar Sesión"),
              iniciarSesionConGoogle(),
            ],
          ),
        ),
        )
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
        print("Usuario:");
        print(user.displayName);

        print('User is signed in!');
      }
    });
    return existeLogin;
  }
  /*
  String nombreUsuarioLogin(){
    Null auxUser = null;
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        return user.displayName;
        print('User is signed in!');
      }
    });
    return "";
  }
*/
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


  inicioSesion() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: contrasena.text
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



   Widget botonIniciarSesion(String texto) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: estiloBotonHueco(texto),

              onPressed: () {
                      if(comprobarLogInUserContrasena(email.text, contrasena.text)){
                        inicioSesion();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

                      }else{
                        mensajeAlerta("sd", "titulo", "descripcion");
                      }

              }
          );
        }
    );
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

  bool comprobarLogInUserContrasena(String _correo, String _contrasena){
    bool existe = false;
    print("_correoooooooooooooo");
    print(_correo);
    print(_contrasena);
    print(existe);


    final coleccionUsuarios = FirebaseFirestore.instance.collection('usuarios');

    coleccionUsuarios.get().then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          print("dentro del for eaj");

          print(doc["correo"]);
          print(doc["contrasena"]);
          print(existe);


          if(_correo == doc["correo"]){
            print(existe);

            if (_contrasena == doc["contrasena"]){
              print(existe);
              print("aqui queremos entrar");
              existe = true;
            }
          }
      }),
    });
    print("final: $existe");

    return existe;
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

 void mensajeAlerta (String textoBoton, String titulo, String descripcion){
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Error"),
      content: const Text('No se ha podido iniciar sesion'),
      actions: <Widget>[
        TextButton(
            child: const Text("textoBoton"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: "Salud auxiliar")));
            }
        ),
      ],
    ),
  );
}









}
/*
        Interesante

para obtener de firebase
https://medium.com/comunidad-flutter/implementaci%C3%B3n-de-b%C3%BAsqueda-con-firebase-firestore-flutter-4e4461ec9d8c
List<DocumentSnapshot> documentList;
documentList = (await Firestore.instance
        .collection("cases")
        .document(await firestoreProvider.getUid())
        .collection(caseCategory)
        .where("caseNumber", isEqualTo: query)
        .getDouments())
        .documents;

*/