

import 'package:flutter/material.dart';
import 'package:prueba/Constantes.dart';

class Ajustes extends StatelessWidget {
  const Ajustes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Aviso Legal"),
      body: Container(
        margin: EdgeInsets.all(15), //para separar de arriba el margen.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              estiloSubTitulos("1. PROPIEDAD INTELECTUAL:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "propiedadIntelectual"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("2. CONDICIONES DE USO:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "condicionesUso"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("3. RESPONSABILIDAD:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "responsabilidad"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("4. PRIVACIDAD Y DATOS PERSONALES:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "privacidad"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("5. ENLACES EXTERNOS:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "enlacesExternos"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("6. MODIFICACIONES Y ACTUALIZACIONES:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "modificaciones"),

              SizedBox(height: 20.0,),
              estiloSubTitulos("7. JURISDICCIÓN Y LEY APLICABLE:"),
              SizedBox(height: 5.0,),
              consulta(COLECCION_AVISO_LEGAL, DOCUMENTO_BD_AVISO_LEGAL, "jurisdiccion"),

            ],
          ),
        ),
      ),
    );
  }
}
