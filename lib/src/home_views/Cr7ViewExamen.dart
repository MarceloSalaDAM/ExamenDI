import 'package:flutter/material.dart';

import '../singleton/DataHolderExamen.dart';

class Cr7ViewExamen extends StatelessWidget {
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
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Image.network(
              DataHolderExamen().selectedBicho.image!,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            color: Colors.black,
            child: Text(
              DataHolderExamen().selectedBicho.equipo!,
              style: TextStyle(fontSize: 25,color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            color: Colors.black,
            child: Text(
              DataHolderExamen().selectedBicho.anio!,
              style: TextStyle(fontSize: 25,color: Colors.white),
            ),
          ),
        ],
      )),
      backgroundColor: Colors.red.shade50,
    );
  }
}
