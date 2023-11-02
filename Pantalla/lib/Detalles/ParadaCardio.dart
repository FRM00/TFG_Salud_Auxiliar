
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../Constantes.dart';


class ParadaCardio extends StatefulWidget {
  const ParadaCardio( {Key? key}) : super(key: key);

  @override
  State<ParadaCardio> createState() => _ParadaCardio();
}

class _ParadaCardio extends State<ParadaCardio> {
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
              consulta(COLECCION_DETALLES, DOCUMENTO_BD_HEMORRAGIAS, "consiste"),

              SizedBox(height: 15.0,),
              filaItemize("Si es muy severa y prolongada, puede haber fractura de uno o más huesos."),

              SizedBox(height: 20.0,),
              estiloSubTitulos("Convulsiones Generalizadas"),


              SizedBox(height: 15.0,),
              zoomImagen(IMAGEN_CONVULSIONES_QUE_NO_HACER),

            ],
          ),
        ),
      ),
    );
  }


}





