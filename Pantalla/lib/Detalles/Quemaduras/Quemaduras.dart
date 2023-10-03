
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba/main.dart';

import '../../Constantes.dart';
import 'QuemadurasElectricas.dart';
import 'QuemadurasQuimicas.dart';
import 'QuemadurasSolares.dart';

const String IMAGEN_PROFUNDIDAD_QUEMADURA = "assets/logo_sin_fondo.png";
const String IMAGEN_HACER_QUEMADURAS = "assets/logo_sin_fondo.png";
const String IMAGEN_NO_HACER_QUEMADURAS = "assets/logo_sin_fondo.png";
const String QUEMADURAS_ELECTRICAS = "Quemaduras Electricas";
const String QUEMADURAS_QUIMICAS = "Quemaduras Quimicas";
const String QUEMADURAS_SOLARES = "Quemaduras Solares";


class ClaseQuemadura{
  String nombre;
  String foto;

  ClaseQuemadura(this.nombre, this.foto);
}

/*
final TiposQuemaduras = [
  ClaseQuemadura("Quemaduras Electricas", ""),
  ClaseQuemadura("Quemaduras Quimicas", ""),
  ClaseQuemadura("Quemaduras Solares", ""),

];
*/
class Quemaduras extends StatefulWidget {
  const Quemaduras({Key? key}) : super(key: key);

  @override
  State<Quemaduras> createState() => _Quemaduras();
}

class _Quemaduras extends State<Quemaduras> {
  String textoBD = "";
  String q = "oo";
  late Future<dynamic> dinamico;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
    child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0,),

            estiloTituloDetalles("¿En qué consiste?"),
            SizedBox(height: 5.0,),


          //  estiloExplicacionDetalles(q),

            escribirPantalla(COLECCION_DETALLES, DOCUMENTO_BD_QUEMADURAS, "consiste"),
            SizedBox(height: 5.0,),

            estiloTituloDetalles("Valoración de la Quemadura"),
            SizedBox(height: 5.0,),

            estiloExplicacionDetalles(consulta(coleccionCuestionarios, 0, 2)),
            SizedBox(height: 5.0,),

            estiloTituloDetalles("Clasificación de la Profundidad"),
            zoomImagen(IMAGEN_PROFUNDIDAD_QUEMADURAS),

            estiloTituloDetalles("¿Qué Hacer?"),
            zoomImagen(IMAGEN_QUEMADURA_QUE_HACER),

            estiloTituloDetalles("aa"),
            zoomImagen(IMAGEN_QUEMADURA_QUE_NO_HACER),

            botonTipoQuemadura(QUEMADURAS_ELECTRICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_QUIMICAS),
            SizedBox(height: 5.0,),

            botonTipoQuemadura(QUEMADURAS_SOLARES),
            SizedBox(height: 50.0,),


          ],
        ),
    ),
      ),
    );
  }
  Widget botonTipoQuemadura(String texto) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: estiloBotonHueco(texto),
              onPressed: () {
                if(texto == QUEMADURAS_ELECTRICAS) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasElectricas("nombre", "")));
                } else if(texto == QUEMADURAS_QUIMICAS) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasQuimicas("nombre", "")));
                } else if(texto == QUEMADURAS_SOLARES) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuemadurasSolares("nombre", "")));
                }

              }
          );
        }
    );
  }

  Future<Text> getCamposBD() async {
    final doc = await FirebaseFirestore.instance.
    collection("cuestionario_quemaduras").doc("pregunta1");
    String nada = "";
    late Map<String, dynamic> aux;

    await doc.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        //aux = "{${data['r2']}" as Map<String, dynamic>;
        aux = data;
        q = data["r4"];
      },
      onError: (e) => print("Error getting document: $e"),
    );

   print("getCamposBDDDDD_______qqqqq");
   print(aux);
   return Text("{${aux['r2']}");

}

/*
  StreamBuilder<QuerySnapshot> getCamposBD() {

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.
        collection("cuestionario_quemaduras").snapshots(),
        builder: (context, snapshot){
          List<Row> clientWidgets = [];
          if(snapshot.hasData){
            final clients = snapshot.data?.docs.reversed.toList();
            print("nuevaFuncion");
            print(clients);
          }
          return clientWidgets;
        });
    //print("nuevaFuncion");
    //print(.toList().toString());
  }*/





}//final clase





