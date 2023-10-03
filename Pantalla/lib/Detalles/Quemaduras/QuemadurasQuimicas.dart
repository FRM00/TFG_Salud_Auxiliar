
import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
             // estiloTituloDetalles("¿Cómo se ha producido?"),
              SizedBox(height: 5.0,),

             // estiloExplicacionDetalles("kcfszdfcvnpsadzfg"),
              SizedBox(height: 5.0,),

              estiloTituloDetalles("¿Qué hacer?"),
              SizedBox(height: 5.0,),


            ],
          ),
        ),
      ),
    );
  }
}





