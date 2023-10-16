
import 'package:flutter/material.dart';

import '../../Constantes.dart';
import '../../Cuestionarios.dart';

import 'BotonNavigation_Bar/MenuInferior.dart';


class ResultadoCuestionarios extends StatefulWidget {
  const ResultadoCuestionarios(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<ResultadoCuestionarios> createState() => _ResultadoCuestionarios();
}

class _ResultadoCuestionarios extends State<ResultadoCuestionarios> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Resultado del Cuestionario"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: cuestionarioResuelto(Colors.amberAccent),
      ),
    );
  }

  Widget botonVolverInicio(String texto){
    return MaterialButton(
        child: estiloBoton(texto),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

        }
    );
  }

  int calcularResultado(){
    int contador = 0;

    preguntas2.forEach((element) {
      if(element.respuestas.last == element.respuestaCorrecta){
        contador += 20;
      }
    });
    return contador;
  }

    Widget cuestionarioResuelto(Color colorElegido){
   // bool encontrado = false;

      return Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              estiloTituloDetalles("Resultado obtenido: "),
              SizedBox(height: 35.0,),

              Text(calcularResultado().toString() + " / 100",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

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
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        ),
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

                                          //se muestra la opción correcta
                                          if(opcion == preguntas2[index].respuestaCorrecta){
                                            return Row(
                                              children: [
                                                Container(
                                                  width: 350,
                                                  height: 80,
                                                  child: Text(opcion,
                                                    style: TextStyle(fontSize: 18,
                                                    backgroundColor: Colors.green),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                SizedBox(height: 50,),
                                              ],
                                            );

                                            //usuario falla
                                          } else  if(preguntas2[index].respuestas.last == opcion &&
                                              preguntas2[index].respuestas.last != preguntas2[index].respuestaCorrecta){
                                            //encontrado = true;

                                            return Row(
                                              children: [
                                                Container(
                                                  width: 350,
                                                  height: 80,
                                                  child: Text(opcion,
                                                    style: TextStyle(fontSize: 18,
                                                        backgroundColor: Colors.red),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                SizedBox(height: 50,),
                                              ],
                                            );
                                            //opciones que ni falla ni acierta
                                          } else{
                                            return Row(
                                              children: [
                                                Container(
                                                  width: 350,
                                                  height: 80,
                                                  child: Text(opcion,
                                                    textAlign: TextAlign.justify,
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                SizedBox(height: 50,),
                                              ],
                                            );
                                          }
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
              SizedBox(height: 30.0,),

              botonVolverInicio("Inicio"),
              SizedBox(height: 5.0,),

            ],
          )
      );
  }

}//clase





