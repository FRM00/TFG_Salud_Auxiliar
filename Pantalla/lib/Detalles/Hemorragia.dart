
import 'package:flutter/material.dart';

import '../Constantes.dart';


class Hemorragia extends StatefulWidget {
  const Hemorragia({Key? key}) : super(key: key);

  @override
  State<Hemorragia> createState() => _Hemorragia();
}

class _Hemorragia extends State<Hemorragia> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Convulsiones"),
      body: Container(
        margin: EdgeInsets.all(25), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              estiloTituloDetalles("¿En qué consiste?"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "consiste"),

              SizedBox(height: 15.0,),
              estiloTituloDetalles("¿Qué Hacer?"),
              zoomImagen(IMAGEN_HEMORRAGIAS_QUE_HACER),

              estiloTituloDetalles("¿Qué No Hacer?"),
              zoomImagen(IMAGEN_HEMORRAGIAS_QUE_NO_HACER),

              //clasificacion segun el vaso afectado
              SizedBox(height: 5.0,),
              estiloTituloDetalles("Clasificación Según el Vaso Afectado"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Arteriales"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "arteriales"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Venosas"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "venosas"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Capilares"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "capilares"),

              SizedBox(height: 15.0,),
              zoomImagen(IMAGEN_HEMORRAGIAS_CLASIFICACION),

              //clasificacion segun la localizacion
              SizedBox(height: 5.0,),
              estiloTituloDetalles("Clasificación Según su Localización"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Internas"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "internas"),

              SizedBox(height: 5.0,),
              zoomImagen(IMAGEN_HEMORRAGIAS_INTERNAS_QUE_HACER),

              //las siguientes lineas comentadas aparece la info en la imagen IMAGEN_HEMORRAGIAS_INTERNAS_QUE_HACER
              //SizedBox(height: 5.0,),
              //consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "internasConsciente"),
              //SizedBox(height: 5.0,),
              //consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "internaInconsciente"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Exteriorizadas"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "exteriorizadas"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Externas"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "externas"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "externas1"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "externas2"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "externas3"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "externas4"),

              SizedBox(height: 15.0,),
              zoomImagen(IMAGEN_HEMORRAGIAS_TORNIQUETE),


              //NARIZ
              SizedBox(height: 15.0,),
              estiloTituloDetalles("Epitaxis: Salida de Sangre por la Nariz"),

              SizedBox(height: 5.0,),
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "nariz"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Para solucionarlo..."),

              SizedBox(height: 20.0,),
              filaItemize("Mantener erguido al paciente."),
              filaItemize("Comprimir la fosa nasal afectada durante 5´. "),
              filaItemize("Si persiste, realizar taponamiento con una gasa empapada en agua oxigenada y seguir comprimiendo."),
              filaItemize("Opcional: Aplicar un paño frío sobre la nariz y frente."),
              filaItemize("Puede ir acompañado de sangrado por la boca, ya que están comunicados. "),
              filaItemize("Si no remite, traslado para valoración facultativa."),

              SizedBox(height: 15.0,),
              zoomImagen(IMAGEN_HEMORRAGIAS_NARIZ),

            ],
          ),
        ),
      ),
    );
  }
}





