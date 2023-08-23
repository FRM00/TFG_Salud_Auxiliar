import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../main.dart';
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

  String? nombreUser(){
    final user = FirebaseAuth.instance.currentUser;
    String? t = user?.displayName;
    return "Hola " + t!;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(nombreUser()!),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5), //para separar de arriba el margen.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: GridView.builder(
          itemCount: MenuPrincipal.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), //elementos por fila
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(1000, 0, 154, 208),
                ),
                child: GestureDetector(
                  
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ElementoMenu(MenuPrincipal[index].nombre, MenuPrincipal[index].foto)));
                  },
                  child: Column(
                    children: [
                      Image.asset(IMAGEN_LOGO, height: 100.0,),
                      Text(MenuPrincipal[index].nombre)
                      //poner la foto
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


  
  
  









