
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              estiloTituloDetalles("Resultado obtenido: "),
              SizedBox(height: 5.0,),

              Text(calcularResultado().toString() + " / 100"),
              SizedBox(height: 100.0,),

              cuestionarioResuelto(),

              SizedBox(height: 30.0,),

              botonVolverInicio("Inicio"),




            ],
          ),
        ),
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

  cuestionarioResuelto(){
  mostrar la solucion
  }

}//clase





