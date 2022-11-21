//En este fichero Dart crearemos la clase LoginView del examen

import 'package:examen_din1/src/custom_views/InputTextExamen.dart';
import 'package:flutter/material.dart';

class LoginViewExamen extends StatelessWidget {
  LoginViewExamen({Key? key}) : super(key: key);

  IPExamen iUser = IPExamen(
    titulo: "EMAIL",
    textoGuia: "Introducir su email",
  );

  IPExamen iPass = IPExamen(
    titulo: "PASSWORD",
    textoGuia: "Introducir su clave",
    contra: true,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN VIEW EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iUser,
          iPass,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  // Respond to button press
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
