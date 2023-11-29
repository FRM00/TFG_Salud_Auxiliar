/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

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
              SizedBox(height: 25.0,),
              estiloTituloDetalles("Se llamará automáticamente"),
              SizedBox(height: 35.0,),

              botonHacerLlamada("Emergencias", "112"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Bomberos", "085"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Guardia Civil", "062"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Policía Nacional", "091"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Tráfico", "011"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Cruz Roja", "900221122"),
              SizedBox(height: 5.0,),

              botonHacerLlamada("Emergencias Sanitarias", "061"),
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
