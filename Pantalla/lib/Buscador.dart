/*
  Autor: Fernando Revilla Maqueda

 Este código sigue los términos de la Licencia de Documentación Libre GNU (GNU FDL).
 Además, está sujeto a los términos de la Licencia Pública General de GNU (GPL).
 */

import 'package:flutter/material.dart';

import 'Detalles/Convulsiones.dart';
import 'Detalles/Fractura.dart';
import 'Detalles/Hemorragia.dart';
import 'Detalles/Intoxicaciones.dart';
import 'Detalles/Quemaduras/Quemaduras.dart';

const String MENSAJE_BUSCADOR = "¡ Introduzca el auxilio que quiera aprender !";


class CustomSearchClass extends SearchDelegate{
  final List<String> searchList = [
    "Quemaduras", "Intoxicaciones", "Convulsiones", "Hemorragias", "Fracturas"
  ];

  @override
    String get searchFieldLabel => 'Buscar';

  @override
  List<Widget> buildActions(BuildContext context) {
    // here you will add the action you need in your search later we   will add a clear button.
    // construye las acciones

    return [
    IconButton(
      onPressed: (){
        query = '';
      },
      icon: Icon(Icons.close),
    )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // here you will add the leading actions that will be shown before the search bar ( such a back button )
    //construir un icono o la parte de inicio

    return IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // in this method you will build your search results widget and how would you like to view them on screen
    //resultados disponibles al pulsar enter

    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            print("aa");
            if ( searchResults[index] == "Quemaduras"){ //quemaduras
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Quemaduras()));
            }else if (searchResults[index] == "Intoxicaciones"){ //intoxicaciones
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Intoxicaciones()));
            }else if (searchResults[index] == "Convulsiones"){ //convulsiones
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Convulsiones()));
            }else if (searchResults[index] == "Hemorragias"){ //hemorragias
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Hemorragia()));
            }else if (searchResults[index] == "Fracturas"){ // fractura
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Fractura()));
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // you can use this method to show suggestions before the user start search or to view a real time search results as we will show later
    //cuando se esta escribiendo
    /*searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    searchResult.clear();
*/
    return Text(MENSAJE_BUSCADOR);

  }

}

