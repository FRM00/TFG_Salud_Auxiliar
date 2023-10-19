
import 'package:flutter/material.dart';

import '../../BotonNavigation_Bar/MenuInferior.dart';
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
      appBar: appBarPantallas(context, "Quemaduras Solares"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS_QUIMICAS, "consiste"),
              zoomImagen(IMAGEN_QUEMADURA_SOLAR_PREVENIR),

              botonVolverInicio("Inicio"),
              SizedBox(height: 5.0,),
            ],
          ),
        ),
      ),
    );
  }
  Widget botonVolverInicio(String texto){
    return MaterialButton(
        height: 100,
        child: estiloBoton(texto),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
        }
    );
  }
}





