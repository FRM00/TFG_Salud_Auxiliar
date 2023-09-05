/*

Widget appBarSA(String nombreUsuario){
  return AppBar(
    title: Text(nombreUsuario),
    backgroundColor: Colors.blue,
  );
}

 */

import 'package:flutter/material.dart';

class CustomSearchClass extends SearchDelegate{

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
    //resultados al pulsar enter

    return Text("buildResults");

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // you can use this method to show suggestions before the user start search or to view a real time search results as we will show later
    //cuando se esta escribiendo
    /*searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    searchResult.clear();
*/
    return Text("buildSuggestion");

  }

}

