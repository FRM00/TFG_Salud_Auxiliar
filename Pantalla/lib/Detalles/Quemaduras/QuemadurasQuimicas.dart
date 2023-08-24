
import 'package:flutter/material.dart';


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





