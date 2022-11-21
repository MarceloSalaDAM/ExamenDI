//En este fichero Dart crearemos la clase LoginView del examen

import 'package:examen_din1/src/custom_views/InputTextExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void btnAceptarPressed(
      String emailAdress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed('/Home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not found') {
        print('No user found for that email');
      } else if (e.code == 'wrong password') {
        print('Wrong password provided for that user.');
      }
    }
  }

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
                  btnAceptarPressed(iUser.getText(), iPass.getText(), context);
                  print("SESION INICIADA CON----------->>> " +
                      " " +
                      iUser.getText() +
                      " " +
                      iPass.getText());
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
