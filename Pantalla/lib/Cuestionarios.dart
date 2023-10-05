import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:prueba/ResultadosCuestionarios.dart';

import '../../Constantes.dart';

class Cuestionarios extends StatefulWidget {
  const Cuestionarios(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<Cuestionarios> createState() => _Cuestionarios();
}

class _Cuestionarios extends State<Cuestionarios> {
  /*final List<Pregunta> preguntas = [
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
  ];*/
  int _value = 1;

  void opcionSeleccionada(int indexPregunta, int indexOpcion) {
    final Pregunta pregunta = preguntas2[indexPregunta];
    final String opcion = pregunta.opciones[indexOpcion];
    final bool seleccionada = pregunta.respuestas.contains(opcion);

    final respuestas = List<String>.from(pregunta.respuestas);

    print("\n\n\nen OpcionSeleccionada");
    print(pregunta.respuestas.toString());
    print("Seleccionada " + seleccionada.toString());
    //print("\n-opciooon  " + opcion.toString());


    if (seleccionada) {
      respuestas.remove(opcion);
    } else {
      respuestas.add(opcion);
    }

    preguntas2[indexPregunta] = pregunta.actualizarPregunta(respuestas);
/*
    print("debajoooooooooooooyuyyyy");
    print("indexPreguntas " + indexPregunta.toString());
    print("preguntas[indexpreguntas]" + preguntas[indexPregunta].toString());*/
    setState(() {});
  }
  var selectedRadio;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(var val){
    setState(() {
      selectedRadio = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    //preguntas2.add(value);


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
                    height: 25.0,
                    child:
                    ListView(children: [
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                        child: Column(
                          children:
                          List.generate(
                            preguntas2.length,
                                (index) {
                              final pregunta = preguntas2[index];
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

                                          print("seleccionada en el lio " + seleccionada.toString());
                                          print("respuestas en el lio " + pregunta.respuestas.toString());
                                          print("opcion en el lio " + opcion.toString());

                                          return Row(

                                            children: [
                                                  Checkbox(
                                                      value: seleccionada,
                                                      //groupValue: selectedRadio,

                                                      onChanged: (value){
                                                        setState(() {
                                                          print("seleccionada en setState " + seleccionada.toString());
                                                          setSelectedRadio(value);
                                                         // pregunta.opciones[indexOpciones] = value!;
                                                        });

                                                        opcionSeleccionada(index, indexOpciones);
                                                  }),
                                              //radioCuestionario(index, indexOpciones),
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
        // child: SingleChildScrollView(

        //),
      ),
    );
  }
/*
  Widget listaPreguntas() {
    return ;
  }*/


  Widget botonEnviarRespuesta(String texto){
    return MaterialButton(
        child: estiloBoton(texto),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultadoCuestionarios("", "")));

        }
    );
  }

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






}//clase pregunta
