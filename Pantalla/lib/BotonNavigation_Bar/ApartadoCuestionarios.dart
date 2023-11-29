/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Cuestionarios.dart';

import '../Buscador.dart';
import '../Constantes.dart';
import 'Inicio.dart';

class Localizacion extends StatelessWidget {
  const Localizacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Cuestionarios"),
      body: Container(
        margin: EdgeInsets.only(top: 15), //para separar de arriba el margen.
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

        ),
        child: GridView.builder(
            itemCount: MenuPrincipal.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisExtent: 100), //elementos por fila
            itemBuilder: (context, index){
              return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(1000, 0, 154, 208),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      if (index == 0){ //quemaduras
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("Quemaduras", cuestionarioQuemaduras, cuestionarios[0])));
                      }else if (index == 1){ //intoxicaciones
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("Intoxicaciones", cuestionarioIntoxicaciones, cuestionarios[1])));
                      }else if (index == 2){ //convulsiones
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("Convulsiones", cuestionarioConvulsiones, cuestionarios[2])));
                      }else if (index == 3){ //hemorragias
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("Hemorragias", cuestionarioHemorragias, cuestionarios[3])));
                      }else if (index == 4){ //fracturas
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("Fracturas", cuestionarioFracturas, cuestionarios[4])));
                      }
                    },
                    child: Column(
                      children: [
                        estiloTituloDetalles(MenuPrincipal[index].nombre),
                      ],
                    ),
                  )
              );
            }
        ),

      ),
    );
  }
}




