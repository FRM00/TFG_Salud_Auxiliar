
import 'package:flutter/material.dart';

import '../../main.dart';
import 'QuemadurasElectricas.dart';
import 'QuemadurasQuimicas.dart';
import 'QuemadurasSolares.dart';

const String IMAGEN_PROFUNDIDAD_QUEMADURA = "assets/logo_sin_fondo.png";
const String IMAGEN_HACER_QUEMADURAS = "assets/logo_sin_fondo.png";
const String IMAGEN_NO_HACER_QUEMADURAS = "assets/logo_sin_fondo.png";
const String QUEMADURAS_ELECTRICAS = "Quemaduras Electricas";
const String QUEMADURAS_QUIMICAS = "Quemaduras Quimicas";
const String QUEMADURAS_SOLARES = "Quemaduras Solares";


class ClaseQuemadura{
  String nombre;
  String foto;

  ClaseQuemadura(this.nombre, this.foto);
}

final TiposQuemaduras = [
  ClaseQuemadura("Quemaduras Electricas", ""),
  ClaseQuemadura("Quemaduras Quimicas", ""),
  ClaseQuemadura("Quemaduras Solares", ""),

];

class Quemaduras extends StatefulWidget {
  const Quemaduras({Key? key}) : super(key: key);

  @override
  State<Quemaduras> createState() => _Quemaduras();
}

class _Quemaduras extends State<Quemaduras> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
    child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Text("¿En qué consiste?",
            style: TextStyle(fontSize: 15),),
            Text("Explicacion"),

            Text("Valoración de la Quemadura"),
            Text("Explicacion"),

            Text("Clasificación de la Profundidad"),
            Image.asset(IMAGEN_PROFUNDIDAD_QUEMADURA, height: 180.0,),

            Text("¿Qué Hacer?"),
            Image.asset(IMAGEN_HACER_QUEMADURAS, height: 180.0,),

            Text("¿Qué NO Hacer?"),
            Image.asset(IMAGEN_NO_HACER_QUEMADURAS, height: 180.0,),

            botonTipoQuemadura(QUEMADURAS_ELECTRICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_QUIMICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_SOLARES),
            SizedBox(height: 5.0,),


          ],
        ),
    ),
      ),
    );
  }
  Widget botonTipoQuemadura(String texto) {
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
                if(texto == QUEMADURAS_ELECTRICAS) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasElectricas("nombre", "")));
                } else if(texto == QUEMADURAS_QUIMICAS) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasQuimicas("nombre", "")));
                } else if(texto == QUEMADURAS_SOLARES) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasSolares("nombre", "")));
                }

              }
          );
        }
    );
  }



}





