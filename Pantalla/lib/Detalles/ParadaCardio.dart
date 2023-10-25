
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../Constantes.dart';


class ParadaCardio extends StatefulWidget {
  const ParadaCardio( {Key? key}) : super(key: key);

  @override
  State<ParadaCardio> createState() => _ParadaCardio();
}

class _ParadaCardio extends State<ParadaCardio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarPantallas(context, "Parada Cardio Respiratoria"),
      body: Container(

      ),
    );
  }


}





