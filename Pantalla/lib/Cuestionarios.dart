import 'package:flutter/material.dart';

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
                          children: List.generate(
                            preguntas.length,
                                (index) {
                              final pregunta = preguntas[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pregunta.enunciado),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    children: List.generate(pregunta.opciones.length,
                                            (indexOpciones) {
                                          final opcion = pregunta.opciones[indexOpciones];
                                          final seleccionada = pregunta.respuestas.contains(opcion);

                                          return Row(
                                            children: [
                                              Checkbox(
                                                value: seleccionada,
                                                onChanged: (value) {
                                                  opcionSeleccionada(index, indexOpciones);
                                                },
                                              ),
                                              /*    Radio(value: seleccionada, groupValue: indexOpciones, onChanged: (value){
                                                    opcionSeleccionada(index, indexOpciones);
                                }),*/
                                              Text(pregunta.opciones[indexOpciones])
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            },
                          ),
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
  }
/*
  Widget listaPreguntas() {
    return ;
  }*/


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
