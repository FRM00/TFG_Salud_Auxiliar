
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BotonNavigation_Bar/MenuInferior.dart';
import 'GoogleInicioSesion.dart';
import 'main.dart';

const String REGISTRARSE = "Registrar Usuario";


class Registrarse extends StatelessWidget {
  final firebase = FirebaseFirestore.instance;
  TextEditingController contrasena = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(REGISTRARSE),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100.0,),
            Image.asset(IMAGEN_LOGO, height: 180.0,),
            SizedBox(height: 45.0,),
            userTextField(),

            SizedBox(height: 5.0,),
            passwordTextField(),

            SizedBox(height: 2.0,),
            textoRegistrarse(),

            SizedBox(height: 2.0,),
            botonIniciarRegistrarUser("Registrar Usuario"),
          ],
        ),
      ),
    );
  }

  Widget userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: email,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "ejemplo@gmail.com",
                labelText: "Correo Electrónico",
              ),
            ),
          );
        }
    );
  }

  Widget passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: contrasena,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "Contraseña",
                labelText: "Contraseña",
              ),
              onChanged: (value){

              },
            ),
          );
        }
    );
  }

  registroUsuario() async {
    try{
      await firebase.collection("usuarios").doc().set({
        "contrasena": contrasena.text,
        "correo": email.text
      }
      );
    }catch(e){
      print("Error al registrar usuario");
    }
  }




  Widget botonIniciarRegistrarUser(String texto) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(

                  padding: EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(texto),
                    ],
                  )
              ),

              onPressed: () {

                if(texto == "Registrar Usuario"){
                  registroUsuario();
                } else if (texto == "Iniciar Sesión"){
                  //  existeNombreUser(email.toString());
                  final au = FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: "fer88@fer.com",
                      password: "fer");
                  if (au != null){
                    print("deeeentro");

                  }else{
                    print("fueeera");

                  }
                }
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));
                //mandar datos al servidor
              }
          );
        }
    );
  }

  Widget iniciarSesionConGoogle() {
    return StreamBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("       Iniciar Sesión con Gmail",),
                      Image.asset(IMAGEN_GOOGLE, height: 75,),

                    ],
                  )


              ),
              onPressed: () async{
                await GoogleInicioSesion().iniciarSesionGoogle();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

              }
          );
        }
    );
  }

  Widget textoRegistrarse() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                margin: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Registrarse()));
              }
          );
        }
    );
  }

  void comprobarExisteUsuario(){
    //metodo para comprobar si existe el usuario
    final a = firebase.collection("usuarios");
    final q = a.where("correo", isEqualTo: "p@54p.com").get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          if (docSnapshot.exists){
            print('${docSnapshot.id} => ${docSnapshot.data()}');

          }else{
            print("rrfdr");

          }
        }
      },
    );
  }

}



