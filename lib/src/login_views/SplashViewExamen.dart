import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewExamen extends StatefulWidget {
/*  Vista de la pantalla de carga del inicio para poder
  comprobar si existe el usuario, si existe el perfil, etc.*/
  SplashViewExamen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashViewExamenState();
  }
}

class _SplashViewExamenState extends State<SplashViewExamen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargaDatos();
  }

/*  Esta función descarga los datos del firebase, y dependiendo de una cosa
  u otra nos lleva a una pantalla*/
  void descargaDatos() async {
    await Future.delayed(Duration(seconds: 3));

    if (FirebaseAuth.instance.currentUser == null) {
      setState(() {
        Navigator.of(context).popAndPushNamed("/Login");
      });
    } else {
      bool existe = await checkExistingProfile();
      if (existe) {
        setState(() {
          Navigator.of(context).popAndPushNamed("/Home");
        });
      } else {
        setState(() {
          Navigator.of(context).popAndPushNamed("/OnBoarding");
        });
      }
    }
  }

  Future<bool> checkExistingProfile() async {
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("usuarios").doc(idUser);

    DocumentSnapshot docsnap = await docRef.get();

    return docsnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Image(
              image: AssetImage("assets/cr7.png"),
            ),
          ),
          const LinearProgressIndicator(
            semanticsLabel: 'Circular progress indicator',
          )
        ],
      ),
    ));
  }
}
