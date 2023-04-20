import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'ElementoMenuPrincipal.dart';

/*
Clase para las entradas del menu
 */
class ElementoMenuPrincipal {
  String nombre;
  String foto;

  ElementoMenuPrincipal(this.nombre, this.foto);
}

/*
Declaramos el array de las entradas del menu
 */
final MenuPrincipal = [
  ElementoMenuPrincipal("Quemaduras", ""),
  ElementoMenuPrincipal("Intoxicaciones", ""),
  ElementoMenuPrincipal("Convulsiones", ""),
  ElementoMenuPrincipal("Parada Cardiorrespiratoria", ""),
  ElementoMenuPrincipal("Obstrucción vía aerea", ""),
  ElementoMenuPrincipal("Hemorragias", ""),
  ElementoMenuPrincipal("Fracturas", ""),

];


class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50), //para separar de arriba el margen.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: GridView.builder(
          itemCount: MenuPrincipal.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), //elementos por fila
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.zero,
                color: Colors.brown,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ElementoMenu(MenuPrincipal[index].nombre, MenuPrincipal[index].foto)));
                  },
                  child: Column(
                    children: [
                      Text(MenuPrincipal[index].nombre)

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


  
  
  









