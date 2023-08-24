
import 'package:flutter/material.dart';


class ParadaCardio extends StatefulWidget {
  const ParadaCardio( {Key? key}) : super(key: key);

  @override
  State<ParadaCardio> createState() => _ParadaCardio();
}

class _ParadaCardio extends State<ParadaCardio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Parada Cardiorespiratoria"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

      ),
    );
  }
}





