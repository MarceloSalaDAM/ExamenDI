import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/singleton/DataHolderExamen.dart';
import 'package:flutter/material.dart';

import '../firebase_objects/BichosExamen.dart';
import '../list_items/BichosItemExamen.dart';

class HomeViewExamen extends StatefulWidget {
  //Vista del Home (pagina inicial de la aplicación)
  @override
  State<StatefulWidget> createState() {
    return _HomeViewExamenState();
  }
}

class _HomeViewExamenState extends State<HomeViewExamen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String nombre = "";
  List<BichosExamen> bichos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCr7List();
  }

  //Descarga de los elementos de la coleccion para la lista
  void getCr7List() async {
    final docRef = db.collection("bichos").withConverter(
        fromFirestore: BichosExamen.fromFirestore,
        toFirestore: (BichosExamen bicho, _) => bicho.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for (int i = 0; i < docsSnap.docs.length; i++) {
        bichos.add(docsSnap.docs[i].data());
      }
    });
  }

  void listItemShortClicked(int index) {
    print("CR7: " + bichos[index].tipo!);
    DataHolderExamen().selectedBicho = bichos[index];
    Navigator.of(context).pushNamed("/Cr7View");
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
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: bichos.length,
        itemBuilder: (BuildContext context, int index) {
          return BichosItemExamen(
              tituloLista: bichos[index].tipo!,
              onShortClick: listItemShortClicked,
              index: index);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        mini: true,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/Formulario');
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
    );
  }
}
