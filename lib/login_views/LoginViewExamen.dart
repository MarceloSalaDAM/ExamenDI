//En este fichero Dart crearemos la clase LoginView del examen

import 'package:flutter/material.dart';

class LoginViewExamen extends StatelessWidget {
  LoginViewExamen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN VIEW EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Center(child: Column()),
      backgroundColor: Colors.white,
    );
  }
}
