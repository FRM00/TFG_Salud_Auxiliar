/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */
import 'package:flutter/material.dart';

import '../../BotonNavigation_Bar/MenuInferior.dart';
import '../../Constantes.dart';


class QuemadurasQuimicas extends StatefulWidget {
  const QuemadurasQuimicas(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<QuemadurasQuimicas> createState() => _QuemadurasQuimicas();
}

class _QuemadurasQuimicas extends State<QuemadurasQuimicas> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Quemaduras Químicas"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS_QUIMICAS, "consiste"),
              zoomImagen(IMAGEN_QUEMADURA_QUIMICA_QUE_HACER),

              botonVolverInicio("Inicio"),
              SizedBox(height: 5.0,),
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





