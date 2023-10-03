import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../Constantes.dart';

class Cuestionarios extends StatefulWidget {
  const Cuestionarios(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<Cuestionarios> createState() => _Cuestionarios();
}

class _Cuestionarios extends State<Cuestionarios> {
  final List<Pregunta> preguntas = [
    Pregunta(
        enunciado: "enunciado1",
        opciones: ["opcion1", "opcion2", "opcion3", "opcion4"]),
    Pregunta(
        enunciado: "enunciado2",
        opciones: ["opcion11", "opcion22", "opcion33", "opcion44"]),
    Pregunta(
        enunciado: "enunciado3",
        opciones: ["opcion1", "opcion2", "opcion3", "opcion4"]),
    Pregunta(
        enunciado: "enunciado4",
        opciones: ["opcion11", "opcion22", "opcion33", "opcion44"])
  ];
  int _value = 1;

  void opcionSeleccionada(int indexPregunta, int indexOpcion) {
    final Pregunta pregunta = preguntas[indexPregunta];
    final String opcion = pregunta.opciones[indexOpcion];
    final bool seleccionada = pregunta.respuestas.contains(opcion);

    final respuestas = List<String>.from(pregunta.respuestas);

    if (seleccionada) {
      respuestas.remove(opcion);
    } else {
      respuestas.add(opcion);
    }

    preguntas[indexPregunta] = pregunta.actualizarPregunta(respuestas);
    setState(() {});
  }

  String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";

  final _status = ["Pending", "Released", "Blocked"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario de Quemaduras"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                    height: 5.0,
                    child:
                    ListView(children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          children: <Widget>[
                            //iterDocumento(coleccionCuestionarios, "pregunta1", "campo"),

                            for (int i = 0; i <= 4; i++)
                              sdfsadfg
                              Text(documentoBD.values.toString() as String),
                              //consulta(coleccionCuestionarios, i, 0),
                              for (int j = 1; j <= 4; j++)
                                radioCuestionario(0, j),
                          ]
                        ),
                      ),
                    ]),
                  )
              ),
              estiloBoton("Enviar Respuestas")

            ],
          )
        // child: SingleChildScrollView(

        //),
      ),
    );
  }// clase



/*
  Widget listaPreguntas() {
    return ;
  }*/
Widget radioCuestionario(int documento, int campo){

    return ListTile(
      title: consulta(coleccionCuestionarios, documento, campo),
      leading: Radio(
        value: campo,
        groupValue: _value,
        //activeColor: Color(0xFF6200EE),
        onChanged: (value) {
          setState(() {
            _value = value!;
          });
        },
      ),
    );
}

  void cuestionarioEntero(){
    for (int i = 0; i <= 4; i++){
      consulta(coleccionCuestionarios, i, 0);

      for (int j = 1; j <= 4; j++){
        radioCuestionario(0, j);
      }
    }
  }
  /*
metodo para iterar un documento
 */
  FutureBuilder<DocumentSnapshot> iterDocumento(CollectionReference coleccion, String documento, String campo) {

    return FutureBuilder<DocumentSnapshot>(
      future: coleccion.doc(documento).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          data.forEach((key, value) {
            print("kvkvkvkvkvkvkvkvkvkvkvvvvvvvv");
            Text(key.toString());
            Text(value.toString());

            for (int i = 0; i <= 4; i++){
              if(key == "pregunta"){
                Text(value);
              }
              /*for (int j = 1; j <= 4; j++){
                radioCuestionario(0, j);
              }*/
            }
          });
          //return Text("${data[campo]}");
        }
        return Text("");
      },
    );
  }

}//la clase



/*
              estiloTituloDetalles("¿Qué hacer?"),
              SizedBox(height: 5.0,),
*/

class Pregunta {
  final String enunciado;
  final List<String> opciones;
  final List<String> respuestas;

  Pregunta({
    required this.enunciado,
    required this.opciones,
    this.respuestas = const [],
  });

  Pregunta actualizarPregunta(List<String> respuestas) {
    return Pregunta(
      enunciado: enunciado,
      opciones: opciones,
      respuestas: respuestas,
    );
  }
}
