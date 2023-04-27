import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba/BotonNavigation_Bar/Inicio.dart';
import 'package:prueba/IniciarSesion.dart';
import 'package:prueba/Registrarse.dart';

import 'BotonNavigation_Bar/Cuenta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



const String IMAGEN_LOGO = "assets/logo1.jpg";
const String IMAGEN_GOOGLE = "assets/google.png";
const String NOMBRE_APP = "Salud Auxiliar";


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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(NOMBRE_APP),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

      SizedBox(height: 100.0,),
            Image.asset(IMAGEN_LOGO, height: 180.0,),
          //  SizedBox(height: 40.0,),
            //CircularProgressIndicator(color: Color.fromRGBO(0, 154, 208, 0.0),),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Main");
    print(firebas.collection("usuarios").doc());

    Navigator.push(context, MaterialPageRoute(builder: (context)=> IniciarSesion()));
        },                                                            //cambiar por iniciar sesion
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
void pintar(){
  print(firebas.collection("usuarios"));

}
  void loading() async{
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
    }
    );
  }

}



