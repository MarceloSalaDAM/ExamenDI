import 'package:flutter/material.dart';

import '../singleton/DataHolderExamen.dart';

class Cr7ViewExamen extends StatelessWidget {
  //Vista de cada uno de los elementos de la lista
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(DataHolderExamen().selectedBicho.tipo!),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Image.network(
              DataHolderExamen().selectedBicho.image!,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
            color: Colors.black,
            child: Text(
              DataHolderExamen().selectedBicho.equipo!,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
            color: Colors.black,
            child: Text(
              DataHolderExamen().selectedBicho.anio!,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      )),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
