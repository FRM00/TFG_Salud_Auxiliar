

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
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Su Cuenta"),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Image.asset(IMAGEN_LOGO, height: 180.0,),
            SizedBox(height: 20,),

            filaDatosUsuario(NOMBRE_USER, getNombreUser()!),
            SizedBox(height: 15,),

            filaDatosUsuario(CORREO_ELECTRONICO, getEmailUser()!),

            SizedBox(height: 20,),

            estiloTituloDetalles("Resultado de los Cuestionarios"),

            SizedBox(height: 15,),

            Expanded(
                child: SizedBox(
                  height: 25.0,
                  child:
                  ListView(children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 25, right: 15),
                      child: Column(
                        children:
                        List.generate(
                          cuestionarios.length,
                              (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cuestionarios[index].nombre,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5,),
                                filaCuestionario("Intentos: " + cuestionarios[index].intentos.toString()),

                                SizedBox(height: 5.0,),
                                filaCuestionario("Máxima Puntuación: " + cuestionarios[index].maximaPuntuacion.toString()),
                                SizedBox(height: 20.0,),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                )
            ),
            botonLogOut(),
          ],
        ),
      ),
    );
  }

  Widget filaCuestionario(String texto){
    return Row(
      children: [
        Icon(Icons.arrow_right, ),

        Container(
          child: Text(texto,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
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

  Widget filaDatosUsuario(String texto, String valor){
    return Wrap(
        children: <Widget>[
          estiloExplicacionDetalles(texto),
          estiloExplicacionDetalles(valor),
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
} //clase cuenta


