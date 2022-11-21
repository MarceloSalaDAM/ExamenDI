import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewExamen extends StatefulWidget {
  SplashViewExamen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashViewExamenState();
  }
}

class _SplashViewExamenState extends State<SplashViewExamen> {
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
      child: Text("SPLASH"),
    ));
  }
}
