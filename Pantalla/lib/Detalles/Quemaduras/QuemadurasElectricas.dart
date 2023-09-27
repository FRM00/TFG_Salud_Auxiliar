
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

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        title: Text("Quemaduras Electricas"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore
                  .instance
              .collection('cuestionario_quemaduras') //  Your desired collection name here
              .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['r2']), // 👈 Your valid data here
                );
              }).toList());
        },
      ),
      ),
    );
  }
}





