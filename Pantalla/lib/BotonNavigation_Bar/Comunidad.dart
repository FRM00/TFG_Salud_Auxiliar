

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Constantes.dart';

class Comunidad extends StatelessWidget {
  const Comunidad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Comunidad"),
      body: Text("Locaaaaal"),
    );
  }
}
