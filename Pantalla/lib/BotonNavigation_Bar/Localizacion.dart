
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("convulsiones", cuestionarioQuemaduras, cuestionarios[2])));
                      }else if (index == 3){ //parada cardiorespiratoria
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("parada cardiorespiratoria", cuestionarioQuemaduras, cuestionarios[3])));
                      }else if (index == 4){ //obstruccionvia aerea
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("obstruccionvia aerea", cuestionarioQuemaduras, cuestionarios[4])));
                      }else if (index == 5){ //hemorragias
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("hemorragias", cuestionarioQuemaduras, cuestionarios[5])));
                      }else if (index == 6){ //fracturas
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cuestionarios("fracturas", cuestionarioQuemaduras, cuestionarios[6])));
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




