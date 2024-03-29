/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Detalles/Convulsiones.dart';
import 'package:prueba/Detalles/Fractura.dart';
import 'package:prueba/Detalles/Hemorragia.dart';
import 'package:prueba/Detalles/Intoxicaciones.dart';
import '../Constantes.dart';
import '../Detalles/Quemaduras/Quemaduras.dart';

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
      appBar: appBarPantallas(context, nombreUser()!),
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
                    if (index == 0){ //quemaduras
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Quemaduras()));
                    }else if (index == 1){ //intoxicaciones
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Intoxicaciones()));
                    }else if (index == 2){ //convulsiones
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Convulsiones()));
                    }else if (index == 3){ //parada cardiorespiratoria
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Hemorragia()));
                    }else if (index == 4){ //obstruccionvia aerea
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Fractura()));
                    }
                    },
                  child: Column(
                    children: [
                      SizedBox(height: 10.0,),
                      Image.asset(foto(index), height: 100.0,),

                      SizedBox(height: 15.0,),
                      Text(MenuPrincipal[index].nombre,
                        style: TextStyle(
                          //fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),)
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
  
  String foto(int index){

    if (index == 0){ //quemaduras
      return IMAGEN_LOGO_QUEMADURAS;
    }else if (index == 1){ //intoxicaciones
      return IMAGEN_LOGO_INTOXICACIONES;
    }else if (index == 2){ //convulsiones
      return IMAGEN_LOGO_CONVULSIONES;
    }else if (index == 3){ //HEMORRAGIAS
      return IMAGEN_LOGO_HEMORRAGIAS;
    }else if (index == 4){ //FRACTUAS
      return IMAGEN_LOGO_FRACTURAS;
    }    
    return "";
  }
}


  
  
  









