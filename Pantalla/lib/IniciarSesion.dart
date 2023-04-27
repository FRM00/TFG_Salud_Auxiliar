
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/BotonNavigation_Bar/MenuInferior.dart';
import 'package:prueba/GoogleInicioSesion.dart';
import 'package:prueba/main.dart';
import 'BotonNavigation_Bar/Inicio.dart';
import 'Registrarse.dart';
import 'package:firebase_database/firebase_database.dart';

const String INICIAR_SESION = "Iniciar Sesion";



class IniciarSesion extends StatelessWidget {
  TextEditingController contrasena = TextEditingController();
  TextEditingController email = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> f = FirebaseFirestore.instance.collection("usuarios").snapshots();
  DatabaseReference ref = FirebaseDatabase.instance.ref();


  IniciarSesion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
        title: Text(INICIAR_SESION),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.logout))],
        backgroundColor: Colors.blue,
      ),
      body: Center(
      child: Column(
        children: [


          SizedBox(height: 30.0,),
          Image.asset(IMAGEN_LOGO, height: 240.0,),

          userTextField(),
          passwordTextField(),
          textoRegistrarse(),
          botonIniciarRegistrarUser("Iniciar Sesión"),
          iniciarSesionConGoogle(),
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



}

