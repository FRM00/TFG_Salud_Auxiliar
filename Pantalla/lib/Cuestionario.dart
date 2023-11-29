/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

class Cuestionario {
  final String nombre;
  int intentos = 0;
  int maximaPuntuacion = 0;


  Cuestionario({
    required this.nombre,
    required this.intentos,
    required this.maximaPuntuacion,
  });

}