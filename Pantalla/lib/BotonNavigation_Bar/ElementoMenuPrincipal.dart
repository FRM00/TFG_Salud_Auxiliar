
import 'package:flutter/material.dart';


class ElementoMenu extends StatefulWidget {
  const ElementoMenu(String nombre, String foto, {Key? key}) : super(key: key);

  @override
  State<ElementoMenu> createState() => _ElementoMenuState();
}

class _ElementoMenuState extends State<ElementoMenu> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Localizaaaacion"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

      ),
    );
  }
}





