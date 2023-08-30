
import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              estiloTituloDetalles("¿Cómo se ha producido?"),
              SizedBox(height: 5.0,),

              estiloExplicacionDetalles("kcfszdfcvnpsadzfg"),
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





