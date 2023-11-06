
import 'package:flutter/material.dart';

import '../Constantes.dart';


class Fractura extends StatefulWidget {
  const Fractura({Key? key}) : super(key: key);

  @override
  State<Fractura> createState() => _Fractura();
}

class _Fractura extends State<Fractura> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Fracturas"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_FRACTURAS, "consiste"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Clasificación según la integridad de la piel"),

              SizedBox(height: 15.0,),
              filaItemize("Fracturas Cerradas"),

              SizedBox(height: 15.0,),
              filaItemize("Fracturas Abiertas"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Clasificación según la cara a su posterior inmovilización"),

              SizedBox(height: 15.0,),
              filaItemize("Fracturas alineadas: los fragmentos óseos no se han movido."),

              SizedBox(height: 15.0,),
              filaItemize("Fracturas desplazadas: los fragmentos óseos se desvían por las tensiones musculares."),

              zoomImagen(IMAGEN_FRACTURAS_QUE_HACER),
              zoomImagen(IMAGEN_FRACTURAS_QUE_NO_HACER),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Esguince"),

              SizedBox(height: 15.0,),
              estiloExplicacionDetalles("Sus características son: "),

              SizedBox(height: 15.0,),
              filaItemize("Inflamación de la zona"),
              filaItemize("Dolor intenso"),
              filaItemize("Amoratamiento"),
              filaItemize("Movilidad conservada aunque dolorosa "),

              SizedBox(height: 15.0,),
              estiloExplicacionDetalles("¿Qué hacer? "),

              SizedBox(height: 15.0,),
              filaItemize("Inmovilizar la articulación afectada."),
              filaItemize("Elevar el miembro afectado. "),
              filaItemize("Aplicar frío local."),
              filaItemize("Valoración de la lesión por personal facultativo. "),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Luxación"),

              SizedBox(height: 15.0,),
              estiloExplicacionDetalles("Sus síntomas son: "),

              SizedBox(height: 15.0,),
              filaItemize("Dolor muy agudo."),
              filaItemize("Deformidad (comparar con el miembro sano)."),
              filaItemize("Inmovilidad muy manifiesta. "),

              SizedBox(height: 15.0,),
              estiloExplicacionDetalles("¿Qué hacer? "),

              SizedBox(height: 15.0,),
              filaItemize("NO reducir la luxación."),
              filaItemize("Inmovilizar la articulación afectada."),
              filaItemize("No dar de comer ni beber."),
              filaItemize("Traslado a un centro sanitario."),
            ],
          ),
        ),
      ),
    );
  }
}





