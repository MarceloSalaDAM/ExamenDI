import 'package:examen_din1/src/custom_views/InputTextExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroViewExamen extends StatelessWidget {
  //Vista para el registro de usuarios de la aplicación
  RegistroViewExamen({Key? key}) : super(key: key);

  //Con esta función creamos un usuario y este es añadido al firebase
  void btnRegistroPressed(
      String emailAdress, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAdress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed('/OnBoarding');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    IPExamen iUsuario = IPExamen(
      textoGuia: "Introducir usuario",
      titulo: "CORREO ELECTRÓNICO",
    );
    IPExamen iContra = IPExamen(
      textoGuia: "Introducir contraseña",
      titulo: "CONTRASEÑA",
      contra: true,
    );
    IPExamen iContra2 = IPExamen(
      textoGuia: "Repetir contraseña",
      titulo: "CONTRASEÑA",
      contra: true,
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text("REGISTRO EXAMEN"),
          //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iUsuario,
            iContra,
            iContra2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    if (iContra.getText() == iContra2.getText()) {
                      btnRegistroPressed(
                          iUsuario.getText(), iContra.getText(), context);
                      print("USUARIO CREADO CORRECTAMENTE------>>>" +
                          " " +
                          iUsuario.getText() +
                          " " +
                          iContra.getText());
                    } else {}
                  },
                  child: Text("REGISTRAR"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/Login');
                  },
                  child: Text("VOLVER \nAL LOGIN"),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
