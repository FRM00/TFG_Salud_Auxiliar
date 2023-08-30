
import 'package:flutter/material.dart';

import '../../Constantes.dart';


class QuemadurasSolares extends StatefulWidget {
  const QuemadurasSolares(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<QuemadurasSolares> createState() => _QuemadurasSolares();
}

class _QuemadurasSolares extends State<QuemadurasSolares> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras Solares"),
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

              estiloTituloDetalles("¿Cómo Prevenir?"),
              SizedBox(height: 5.0,),


            ],
          ),
        ),
      ),
    );
  }
}





