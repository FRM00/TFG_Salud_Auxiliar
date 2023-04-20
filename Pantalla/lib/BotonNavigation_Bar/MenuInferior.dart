
import 'package:flutter/material.dart';

import 'Ajustes.dart';
import 'Comunidad.dart';
import 'Cuenta.dart';
import 'Inicio.dart';
import 'Localizacion.dart';




class EstadoPaginas extends StatefulWidget{
  //const EstadoPaginas({Key? key}) : super(key: key);

  MenuInferior createState() => MenuInferior();
}



class MenuInferior extends State<EstadoPaginas> {
  //const MenuInferior({Key? key}) : super(key: key);
  int estadoActual = 2;
  List<Widget> paginas = [Cuenta(), Comunidad(), Inicio(), Localizacion(), Ajustes(),];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: paginas[estadoActual],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: estadoActual,

          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Color.fromRGBO(0, 154, 208, 100.0),
          onTap: (index){
          setState(() {
            estadoActual = index;
          });
        },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Cuenta"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Comunidad"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Localización"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ajustes"),
          ],
        ),

      ),
    );
  }
}