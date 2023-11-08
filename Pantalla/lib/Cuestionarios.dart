import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:prueba/ResultadosCuestionarios.dart';

import '../../Constantes.dart';
import 'Cuestionario.dart';
import 'Pregunta.dart';

class Cuestionarios extends StatefulWidget {
  String nombre;
  //cuestionario que contiene las preguntas, opciones y respuestas disponibles
  List<Pregunta> lista = [];
  Cuestionario cuestionario;
  Cuestionarios(this.nombre, this.lista, this.cuestionario);

  //const Cuestionarios(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<Cuestionarios> createState() => _Cuestionarios();
}

class _Cuestionarios extends State<Cuestionarios> {


  void opcionSeleccionada(int indexPregunta, int indexOpcion) {
    final Pregunta pregunta = widget.lista[indexPregunta];
    final String opcion = pregunta.opciones[indexOpcion];
    final bool seleccionada = pregunta.respuestas.contains(opcion);

    final respuestas = List<String>.from(pregunta.respuestas);

    if (seleccionada) {
      respuestas.remove(opcion);
    } else {
      respuestas.add(opcion);
    }

    widget.lista[indexPregunta] = pregunta.actualizarPregunta(respuestas);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario de " + widget.nombre),
        backgroundColor: Colors.blue,
      ),
      body: cuestionario(azulLogo)
    );
  }

  Widget cuestionario(Color colorElegido){
    return Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: SizedBox(
                  height: 25.0,
                  child:
                  ListView(children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      child: Column(
                        children:
                        List.generate(
                          widget.lista.length,
                              (index) {
                            final pregunta = widget.lista[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pregunta.enunciado,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  direction: Axis.vertical, // main axis (rows or columns)
                                  children: List.generate(pregunta.opciones.length,
                                          (indexOpciones) {
                                        final opcion = pregunta.opciones[indexOpciones]; //opciones de la pregunta que se esta escribiendo
                                        bool seleccionada = pregunta.respuestas.contains(opcion);

                                        return Row(
                                          children: [
                                            Checkbox(
                                                value: seleccionada,
                                                checkColor: colorElegido,
                                                onChanged: (value){
                                                  opcionSeleccionada(index, indexOpciones);
                                                }),
                                            Container(
                                              width: 300,
                                              height: 80,
                                              child: Text(pregunta.opciones[indexOpciones],
                                                style: TextStyle(fontSize: 18),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            SizedBox(height: 50,),
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
            botonEnviarRespuesta("Enviar Respuestas")
          ],
        )
    );
  }

  Widget botonEnviarRespuesta(String texto){
    return MaterialButton(
        child: estiloBoton(texto),
        onPressed: () {
          if (comprobarRespuestaUnica()){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ResultadoCuestionarios(widget.nombre, widget.lista, widget.cuestionario)));
          }else{
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Error"),
                content: const Text(MENSAJE_ALERTA_CUESTIONARIOS),
                actions: <Widget>[
                  TextButton(
                      child: const Text("Volver"),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ],
              ),
            );
          }
        }
    );
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
            Text(key.toString());
            Text(value.toString());

            for (int i = 0; i <= 4; i++){
              if(key == "pregunta"){
                Text(value);
              }
            }
          });
          //return Text("${data[campo]}");
        }
        return Text("");
      },
    );
  }

bool comprobarRespuestaUnica(){
  bool continua = true;

  widget.lista.forEach((element) {

    //hay varias respuestas seleccionadas o falta alguna de contestar
    if(element.respuestas.length == 0 ||
        element.respuestas.length > 1){
      continua = false;
    }
  });
  return continua;
  }





}//la clase



