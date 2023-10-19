
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba/main.dart';

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


class Quemaduras extends StatefulWidget {
  const Quemaduras({Key? key}) : super(key: key);

  @override
  State<Quemaduras> createState() => _Quemaduras();
}

class _Quemaduras extends State<Quemaduras> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Quemaduras"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            estiloTituloDetalles("¿En qué consiste?"),

            SizedBox(height: 5.0,),
            consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "consiste"),

            SizedBox(height: 20.0,),
            estiloTituloDetalles("Valoración de la Quemadura"),
            SizedBox(height: 5.0,),

            estiloSubTitulos("Gravedad"),
            SizedBox(height: 5.0,),

            consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "gravedad"),
            SizedBox(height: 5.0,),

            estiloSubTitulos("Extensión"),
            SizedBox(height: 5.0,),

            consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "extension"),
            SizedBox(height: 5.0,),

            estiloSubTitulos("Localización"),
            SizedBox(height: 5.0,),

            consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "localizacion"),
            SizedBox(height: 5.0,),

            estiloSubTitulos("Profundidad"),
            SizedBox(height: 5.0,),

            consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "profundidad"),
            SizedBox(height: 20.0,),

            estiloTituloDetalles("Clasificación de la Profundidad"),
            zoomImagen(IMAGEN_PROFUNDIDAD_QUEMADURAS),

            estiloTituloDetalles("¿Qué Hacer?"),
            zoomImagen(IMAGEN_QUEMADURA_QUE_HACER),

            estiloTituloDetalles("¿Qué no hacer?"),
            zoomImagen(IMAGEN_QUEMADURA_QUE_NO_HACER),

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





}//final clase





