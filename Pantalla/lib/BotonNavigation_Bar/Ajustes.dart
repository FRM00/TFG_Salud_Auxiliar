

import 'package:flutter/material.dart';
import 'package:prueba/Constantes.dart';

class Ajustes extends StatelessWidget {
  const Ajustes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Ajustes"),
      body: Text("Locaaaaal"),
    );
  }
}
