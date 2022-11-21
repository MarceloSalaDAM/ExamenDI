import 'package:flutter/material.dart';

class HomeViewExamen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewExamenState();
  }
}

class _HomeViewExamenState extends State<HomeViewExamen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME VIEW EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/Login'); ;

                },
                child: Text("ACEPTAR"),
              )
            ],
          )
        ],

      )),
      backgroundColor: Colors.white,
    );
  }
}
