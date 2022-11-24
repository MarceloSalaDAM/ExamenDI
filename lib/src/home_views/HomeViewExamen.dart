import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../list_items/BichosItemExamen.dart';

class HomeViewExamen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewExamenState();
  }
}

class _HomeViewExamenState extends State<HomeViewExamen> {
  FirebaseFirestore db=FirebaseFirestore.instance;
  String nombre="";
  List<BichosItemExamen> bichos= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getCr7List() async {
    final docRef = db.collection("bichos").withConverter(
        fromFirestore: BichosItemExamen.fromFirestore,
        toFirestore: (BichosItemExamen bicho, _) => bicho.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for (int i = 0; i < docsSnap.docs.length; i++) {
        chatRooms.add(docsSnap.docs[i].data());
      }
    });


  }

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
