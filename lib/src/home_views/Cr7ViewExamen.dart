
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

            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}


