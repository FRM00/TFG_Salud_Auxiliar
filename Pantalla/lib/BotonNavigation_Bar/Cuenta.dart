

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../GoogleInicioSesion.dart';
import '../IniciarSesion.dart';
import '../main.dart';
import 'MenuInferior.dart';

const String NOMBRE_USER = "Nombre de Usuario: ";
const String CORREO_ELECTRONICO = "Su correo electrónico: ";
const String CONTRASENA = "Ingrese su contraseña: ";
const String CAMBIAR_CONTRASENA = "Nueva contraseña: ";
const String REPETIR_CONTRASENA = "Repita la nueva contraseña: ";

class Cuenta extends StatelessWidget {
  const Cuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Su Cuenta"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Image.asset(IMAGEN_LOGO, height: 180.0,),

          fila(NOMBRE_USER, "valor"),
          SizedBox(height: 20,),

          fila(CORREO_ELECTRONICO, "Correo"),

          SizedBox(height: 20,),

          Text(CONTRASENA),

          campo("Contraseña"),

          campo(CAMBIAR_CONTRASENA),

          SizedBox(height: 20,),
          Text(REPETIR_CONTRASENA),
          SizedBox(height: 20,),

          campo(CAMBIAR_CONTRASENA),
          SizedBox(height: 10,),

          botonCambiarContrasena()
        ],
      )

    );
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

  Widget botonCambiarContrasena(){
    return MaterialButton(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(1000, 0, 154, 208)),
            borderRadius: BorderRadius.circular(10)

          ),
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0, ),
          child: Text(
            "Log Out",
            style: TextStyle(fontSize: 18, color: Color.fromARGB(1000, 0, 154, 208),),
          ),

        ),
        onPressed: () async {
          await GoogleInicioSesion().logOutGoogle();
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

          // Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
          //poner mensaje emergente de exito o fallo
        }
    );
  }
}
