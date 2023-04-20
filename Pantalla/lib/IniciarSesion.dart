
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/BotonNavigation_Bar/MenuInferior.dart';
import 'package:prueba/main.dart';
import 'BotonNavigation_Bar/Inicio.dart';
import 'Registrarse.dart';

const String INICIAR_SESION = "Iniciar Sesion";



class IniciarSesion extends StatelessWidget {
   IniciarSesion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INICIAR_SESION),
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
          botonIniciarSesion(),

          SizedBox(height: 2.0,),
          botonSinIdentificarse(),

        ],
      ),
    ),
    );
  }

  Widget userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              textAlign: TextAlign.center,

              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "ejemplo@email.com",
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

Widget botonIniciarSesion() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return MaterialButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text("Iniciar Sesión"),
            ),

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EstadoPaginas()));

                }
          );
        }
        );
}

   Widget botonSinIdentificarse() {
     return StreamBuilder(
         builder: (BuildContext context, AsyncSnapshot snapshot){
           return MaterialButton(
               child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                 child: Text("Entrar sin identificarse"),

               ),
               onPressed: () {
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

