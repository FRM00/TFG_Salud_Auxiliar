
import 'dart:io';

import 'package:flutter/material.dart';

import 'Ajustes.dart';
import 'NumerosTelefono.dart';
import 'Cuenta.dart';
import 'Inicio.dart';
import 'ApartadoCuestionarios.dart';




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
    return WillPopScope( //esta clase captura el boton para ir atras. Si es false lo ignora
      onWillPop: () async {
    return false;
    },
      child : MaterialApp(
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
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Teléfonos"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: "Cuestionarios"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "About"),
          ],
        ),

      ),
      ),
    );
  }
}