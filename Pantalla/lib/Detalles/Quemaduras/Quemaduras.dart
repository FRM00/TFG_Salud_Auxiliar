
import 'package:flutter/material.dart';

import '../../Constantes.dart';
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

/*
final TiposQuemaduras = [
  ClaseQuemadura("Quemaduras Electricas", ""),
  ClaseQuemadura("Quemaduras Quimicas", ""),
  ClaseQuemadura("Quemaduras Solares", ""),

];
*/
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
            SizedBox(height: 25.0,),

            estiloTituloDetalles("¿En qué consiste?"),
            SizedBox(height: 5.0,),

            estiloExplicacionDetalles("Explicacionfresrfgsdfgdfg"),
            SizedBox(height: 5.0,),

            estiloTituloDetalles("Valoración de la Quemadura"),
            SizedBox(height: 5.0,),

            estiloExplicacionDetalles("Explicacion"),
            SizedBox(height: 5.0,),

            estiloTituloDetalles("Clasificación de la Profundidad"),
            Image.asset(IMAGEN_PROFUNDIDAD_QUEMADURAS, height: 180.0,),

            estiloTituloDetalles("¿Qué Hacer?"),
            Image.asset(IMAGEN_QUEMADURA_QUE_HACER, height: 180.0,),

            estiloTituloDetalles("¿Qué NO Hacer?"),
            Image.asset(IMAGEN_QUEMADURA_QUE_NO_HACER, height: 180.0,),

            botonTipoQuemadura(QUEMADURAS_ELECTRICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_QUIMICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_SOLARES),
            SizedBox(height: 50.0,),


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
              child: estiloBotonHueco(texto),
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





