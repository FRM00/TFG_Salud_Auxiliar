
import 'package:flutter/material.dart';


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
              Text("¿Cómo se ha producido?",
                style: TextStyle(fontSize: 15),),
              Text("Explicacion"),

              Text("¿Qué hacer?"),


            ],
          ),
        ),
      ),
    );
  }
}





