import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/custom_views/InputTextExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingViewExamen extends StatefulWidget {
  OnBoardingViewExamen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
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

  @override
  Widget build(BuildContext context) {
    IPExamen iNombre = IPExamen(
      textoGuia: "Introducir nombre",
      titulo: "NOMBRE",
    );
    IPExamen iApellidos = IPExamen(
      textoGuia: "Introducir apellidos",
      titulo: "PAIS",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("ON BOARDING EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.withBlue(120),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iNombre,
            iApellidos,
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
