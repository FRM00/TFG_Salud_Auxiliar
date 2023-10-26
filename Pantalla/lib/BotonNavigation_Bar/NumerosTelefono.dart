

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:prueba/Constantes.dart';

class Comunidad extends StatelessWidget {
  const Comunidad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Números de Interés"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0,),
              estiloTituloDetalles("Se llamará automáticamente"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Llamar Javi", "679345646"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Llamar Cova", "689289328"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Llamar Sirenita", "682652964"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Llamar Casa", "975231252"),
              SizedBox(height: 5.0,),

            ],
          ),
        ),
      ),
    );
  }
  Widget botonHacerLlamada(String texto, String numero){
    return MaterialButton(
        child: estiloBoton(texto),
        onPressed: () {
          FlutterPhoneDirectCaller.callNumber(numero);
        }
    );
  }
}
