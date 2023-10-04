
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Constantes.dart';


class QuemadurasElectricas extends StatefulWidget {
  const QuemadurasElectricas(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<QuemadurasElectricas> createState() => _QuemadurasElectricas();
}

class _QuemadurasElectricas extends State<QuemadurasElectricas> {
  final Stream<QuerySnapshot> doc = FirebaseFirestore.instance.
  collection("cuestionario_quemaduras").snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('cuestionario_quemaduras');


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras Electricas"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

          child: Column(
            children: [
              llenarListaPreguntas(coleccionCuestionarios, 0),
              llenarListaPreguntas(coleccionCuestionarios, 1),
              llenarListaPreguntas(coleccionCuestionarios, 2),
              llenarListaPreguntas(coleccionCuestionarios, 3),
              llenarListaPreguntas(coleccionCuestionarios, 4),

              consulta(coleccionCuestionarios, 0, 0)
            ],
          )

      ),
    );
  }
}





