

class Pregunta {
  final String enunciado;
  final List<String> opciones;
  final List<String> respuestas;
  final String respuestaCorrecta;

  Pregunta({
    required this.enunciado,
    required this.opciones,
    this.respuestas = const [],
    required this.respuestaCorrecta
  });

  Pregunta actualizarPregunta(List<String> respuestas) {
    return Pregunta(
        enunciado: enunciado,
        opciones: opciones,
        respuestas: respuestas,
        respuestaCorrecta: respuestaCorrecta
    );
  }


}//clase pregunta