
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/IniciarSesion.dart';

import 'main.dart';

const String REGISTRARSE = "Registrar Usuario";


class Registrarse extends StatelessWidget {
  late IniciarSesion i = IniciarSesion();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(REGISTRARSE),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100.0,),
            Image.asset(IMAGEN_LOGO, height: 180.0,),
            SizedBox(height: 45.0,),
            i.userTextField(),

            SizedBox(height: 5.0,),
            i.passwordTextField(),

            SizedBox(height: 2.0,),
            i.textoRegistrarse(),

            SizedBox(height: 2.0,),
            i.botonIniciarRegistrarUser("Registrar Usuario"),
          ],
        ),
      ),
    );
  }
}



