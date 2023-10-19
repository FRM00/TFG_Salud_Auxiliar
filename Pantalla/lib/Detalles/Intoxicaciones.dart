
import 'package:flutter/material.dart';
import '../Constantes.dart';

class Intoxicaciones extends StatefulWidget {
  const Intoxicaciones({Key? key}) : super(key: key);

  @override
  State<Intoxicaciones> createState() => _Intoxicaciones();
}

class _Intoxicaciones extends State<Intoxicaciones> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Intoxicaciones"),
      body:  Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "consiste"),

              SizedBox(height: 20.0,),
              estiloTituloDetalles("Clasificación según se introduce en el organismo"),
              SizedBox(height: 25.0,),

              estiloSubTitulos("Por Vía Respiratoria"),
              SizedBox(height: 5.0,),

              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "vrExplicacion"),
              SizedBox(height: 5.0,),
              zoomImagen(IMAGEN_INTOXICACION_VIA_RESPIRATORIA_QUE_HACER),
              zoomImagen(IMAGEN_INTOXICACION_HUMO),
              SizedBox(height: 15.0,),

              zoomImagen(IMAGEN_INTOXICACION_MONOXIDO_CARBONO),
              SizedBox(height: 25.0,),

              estiloSubTitulos("A Través de la Piel"),
              SizedBox(height: 15.0,),

              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "pielExplicacion"),
              SizedBox(height: 5.0,),
              estiloTituloDetalles("¿Qué Hacer?"),
              zoomImagen(IMAGEN_INTOXICACION_PIEL_QUE_HACER),

              estiloSubTitulos("Por Vía Digestiva"),
              SizedBox(height: 5.0,),

              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "vdExplicacion"),
              SizedBox(height: 10.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "vdExplicacion2"),
              SizedBox(height: 5.0,),

              estiloTituloDetalles("¿Qué Hacer?"),
              zoomImagen(IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_HACER),

              estiloTituloDetalles("¿Qué no hacer?"),
              zoomImagen(IMAGEN_INTOXICACION_VIA_DIGESTIVA_QUE_NO_HACER),

              estiloTituloDetalles("Intoxicación alcohólica aguda"),
              SizedBox(height: 15.0,),

              zoomImagen(IMAGEN_INTOXICACION_ALCOHOL_QUE_HACER),
              SizedBox(height: 15.0,),

              estiloSubTitulos("Por Vía Circulatoria"),

              consulta(COLECCION_DETALLES, DOCUMENTO_BD_INTOXICACIONES, "vcExplicacion"),
              SizedBox(height: 5.0,),
              zoomImagen(IMAGEN_INTOXICACION_VIA_CIRCULATORIA_QUE_HACER),

            ],
          ),
        ),
      ),
    );
  }
}





