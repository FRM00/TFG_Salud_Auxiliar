
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
      appBar: AppBar(
        title: Text("Quemaduras Quimicas"),
        backgroundColor: Colors.blue,
      ),
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





