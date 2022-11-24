import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/custom_views/InputTextExamen.dart';
import 'package:examen_din1/src/firebase_objects/UsuarioExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingViewExamen extends StatefulWidget {
  OnBoardingViewExamen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardingViewExamenState();
  }
}

class _OnBoardingViewExamenState extends State<OnBoardingViewExamen> {
  var txt = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkExistingProfile();
  }

  void checkExistingProfile() async {
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("usuarios").doc(idUser);

    DocumentSnapshot docsnap = await docRef.get();

    if (docsnap.exists) {
      Navigator.of(context).popAndPushNamed("/Home");
    }
  }

  void acceptPressed(
      String nombre, String apellidos, BuildContext context) async {
    UsuarioExamen usuario = UsuarioExamen(
      nombre: nombre,
      apellidos: apellidos,
    );

    await db
        .collection("usuarios")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(usuario.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    IPExamen iNombre = IPExamen(
      textoGuia: "Introducir nombre",
      titulo: "NOMBRE",
    );
    IPExamen iApellidos = IPExamen(
      textoGuia: "Introducir apellidos",
      titulo: "APELLIDOS",
    );

    /* FirebaseFirestore db = FirebaseFirestore.instance;

    void btnConfirmarPressed() async {
      UsuarioExamen usuario = UsuarioExamen(
        nombre: iNombre.getText(),
        apellidos: iApellidos.getText(),
      );

      db
          .collection("usuarios")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set(usuario.toFirestore())
          .onError((e, _) => print("Error writing document: $e"));
      Navigator.of(context).popAndPushNamed("/Login");
    }*/

    return Scaffold(
      appBar: AppBar(
        title: const Text("ON BOARDING EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iNombre,
            iApellidos,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                /*OutlinedButton(
                  onPressed: () {
                    acceptPressed(
                        iNombre.getText(), iApellidos.getText(), context);
                    print("NOMBRE " +
                        iNombre.getText() +
                        " " +
                        "APELLIDOS " +
                        iApellidos.getText());
                  },
                  child: Text("CONFIRMAR"),
                ),*/
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
