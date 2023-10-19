
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../BotonNavigation_Bar/MenuInferior.dart';
import '../../Constantes.dart';


class QuemadurasElectricas extends StatefulWidget {
  const QuemadurasElectricas(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<QuemadurasElectricas> createState() => _QuemadurasElectricas();
}

class _QuemadurasElectricas extends State<QuemadurasElectricas> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras Electricas"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0,),
              estiloTituloDetalles("Electrocución"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS_ELECTRICAS, "electrocucion"),

              SizedBox(height: 5.0,),
              estiloTituloDetalles("Lesiones Habituales"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS_ELECTRICAS, "habituales"),

              estiloTituloDetalles("¿Qué Hacer?"),
              zoomImagen(IMAGEN_QUEMADURA_ELECTRICA_QUE_HACER),

              SizedBox(height: 25.0,),
              botonVolverInicio("Inicio")

            ],
          ),
        ),
      ),
    );
  }

  Widget botonVolverInicio(String texto){
    return MaterialButton(
        height: 100,
        child: estiloBoton(texto),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
        }
    );
  }
}





