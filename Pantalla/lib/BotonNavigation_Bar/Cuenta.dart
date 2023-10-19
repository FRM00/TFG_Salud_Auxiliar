

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constantes.dart';
import '../GoogleInicioSesion.dart';
import '../main.dart';
import 'MenuInferior.dart';



class Cuenta extends StatefulWidget {
  const Cuenta({Key? key}) : super(key: key);
  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Su Cuenta"),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Image.asset(IMAGEN_LOGO, height: 180.0,),

          fila(NOMBRE_USER, getNombreUser()!),
          SizedBox(height: 20,),

          fila(CORREO_ELECTRONICO, getEmailUser()!),

          SizedBox(height: 20,),

          Text(CONTRASENA),

          campo("Contraseña"),

          campo(CAMBIAR_CONTRASENA),

          SizedBox(height: 20,),
          Text(REPETIR_CONTRASENA),
          SizedBox(height: 20,),

          campo(CAMBIAR_CONTRASENA),
          SizedBox(height: 10,),

          botonLogOut()
        ],
      )

    );
  }

  String? getNombreUser(){
    final user = FirebaseAuth.instance.currentUser;
    String? t = user?.displayName;
    return t;
  }

  String? getEmailUser(){
    final user = FirebaseAuth.instance.currentUser;
    String? t = user?.email;
    return t;
  }

  Widget campo(String identificador){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.password),
        hintText: identificador,
        labelText: identificador,
      ),
    );
  }

  Widget fila(String texto, String valor){
    return Row(
      children: [
        Text(texto),
        Text(valor)
      ],
    );
  }

  Widget botonLogOut(){
    return MaterialButton(
        child: estiloBotonHueco("Log Out"),
        onPressed: () {
          GoogleInicioSesion().logOutGoogle();

          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Log Out'),
              content: const Text('¡Sesión cerrada con éxito!'),
              actions: <Widget>[
                TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: "Salud auxiliar")));
                    }
                ),
              ],
            ),
          );
        }
    );
  }
  Widget boton(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            /*TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),*/
            TextButton(
              child: const Text('OK'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(title: "Salud auxiliar")));
                }
                ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
