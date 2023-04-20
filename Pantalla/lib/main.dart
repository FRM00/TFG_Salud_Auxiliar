import 'package:flutter/material.dart';
import 'package:prueba/BotonNavigation_Bar/Inicio.dart';
import 'package:prueba/IniciarSesion.dart';
import 'package:prueba/Registrarse.dart';




const String IMAGEN_LOGO = "assets/logo1.jpg";
const String NOMBRE_APP = "Salud Auxiliar";


void main() {
  runApp(const MyApp());
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Inicio()));
        },                                                            //cambiar por iniciar sesion
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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



