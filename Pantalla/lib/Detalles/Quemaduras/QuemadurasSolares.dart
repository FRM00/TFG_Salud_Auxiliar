
import 'package:flutter/material.dart';


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
              Text("¿Cómo se ha producido?",
                style: TextStyle(fontSize: 15),),
              Text("Explicacion"),

              Text("¿Cómo prevenir?"),


            ],
          ),
        ),
      ),
    );
  }
}





