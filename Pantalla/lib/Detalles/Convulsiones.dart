
import 'package:flutter/material.dart';
import 'package:prueba/Constantes.dart';


class Convulsiones extends StatefulWidget {
  const Convulsiones({Key? key}) : super(key: key);

  @override
  State<Convulsiones> createState() => _Convulsiones();
}

class _Convulsiones extends State<Convulsiones> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Convulsiones"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_CONVULSIONES, "consiste"),

              SizedBox(height: 15.0,),
              estiloTituloDetalles("Causas más frecuentes de una convulsión"),

              SizedBox(height: 15.0,),
              filaItemize("Epilepsia"),
              filaItemize("Rabia, tétanos, histeria"),
              filaItemize("Traumatismos en el cráneo"),
              filaItemize("Alcoholismo"),
              filaItemize("Intoxicaciones"),
              filaItemize("Fiebre alta (por encima de 38.5ºC)"),
              filaItemize("Factores estresantes, falta de sueño"),

              SizedBox(height: 15.0,),
              estiloSubTitulos("Signos y Síntomas"),

              SizedBox(height: 15.0,),
              filaItemize("Espasmos musculares (contracciones involuntarias de los músculos)"),
              filaItemize("Gritos o gemido repentino."),
              filaItemize("Pérdida de conocimiento."),
              filaItemize("A veces, mordedura de la lengua y salida de espuma por la boca."),
              filaItemize("Falta de control de esfínteres."),
              filaItemize("Si es muy severa y prolongada, puede haber fractura de uno o más huesos."),

              SizedBox(height: 20.0,),
              estiloTituloDetalles("Clasificación de las convulsiones"),

              SizedBox(height: 15.0,),
              estiloSubTitulos("Convulsiones Generalizadas"),

              SizedBox(height: 15.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_CONVULSIONES, "cgExplicacion"),

              SizedBox(height: 15.0,),
              filaItemize("Grite"),
              filaItemize("Perda el conocimiento"),
              filaItemize("Se caiga al suelo"),
              filaItemize("Tenga rigidez o espasmos musculares."),
              filaItemize("La persona puede sentirse cansada luego de tener una convulsión tonicoclónica."),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Convulsiones Focales o Parciales"),

              SizedBox(height: 15.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_CONVULSIONES, "cfpExplicacion"),

              SizedBox(height: 15.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_CONVULSIONES, "cfpExplicacion2"),

              SizedBox(height: 15.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_CONVULSIONES, "cfpExplicacion3"),

              SizedBox(height: 15.0,),
              estiloTituloDetalles("Llame al 911 si:"),

              SizedBox(height: 15.0,),
              filaItemize("La convulsión dura más de 5 minutos."),
              filaItemize("La persona tiene otra convulsión poco después de la primera."),
              filaItemize("La persona se lesiona durante la convulsión."),
              filaItemize("La convulsión se presenta cuando la persona está en el agua."),
              filaItemize("La persona tiene otra afección como diabetes, enfermedad cardiaca o está embarazada"),

              SizedBox(height: 20.0,),
              estiloTituloDetalles("¿Qué Hacer?"),
              zoomImagen(IMAGEN_CONVULSIONES_QUE_HACER),

              estiloTituloDetalles("¿Qué no Hacer?"),
              zoomImagen(IMAGEN_CONVULSIONES_QUE_NO_HACER),

            ],
          ),
        ),
      ),
    );
  }
}





