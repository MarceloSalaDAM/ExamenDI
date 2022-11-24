import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/firebase_objects/BichosExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/InputTextExamen.dart';

class FormularioViewExamen extends StatefulWidget {
  FormularioViewExamen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormularioViewExamen();
  }
}

class _FormularioViewExamen extends State<FormularioViewExamen> {
  var txt = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

/*  LA SUBIDA DE IMAGENES AL FIRESTORE NO ME FUNCIONA, NO HE SIDO CAPAZ DE
  DESCUBRIR COMO HACRELO*/
  void confirmPressed(String tipo, String equipo, String anio, String image,
      BuildContext context) async {
    BichosExamen bicho = BichosExamen(
      tipo: tipo,
      equipo: equipo,
      anio: anio,
      image: image,
    );

    await db
        .collection("bichos")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(bicho.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    IPExamen iTipo = IPExamen(
      textoGuia: "Introducir tipo",
      titulo: "TIPO",
    );
    IPExamen iEquipo = IPExamen(
      textoGuia: "Introducir equipo",
      titulo: "EQUIPO",
    );
    IPExamen iAnio = IPExamen(
      textoGuia: "Introducir año",
      titulo: "AÑO",
    );
    IPExamen iFoto = IPExamen(
      textoGuia: "Introducir URL",
      titulo: "FOTO",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("FORMULARIO EXAMEN"),
        //esta barra de código es para quitar el icono de la flecha arriba a la izquierda de mi aplicacion
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iTipo,
            iEquipo,
            iAnio,
            iFoto,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    confirmPressed(iTipo.getText(), iEquipo.getText(),
                        iAnio.getText(), iFoto.getText(), context);
                  },
                  child: Text("CONFIRMAR"),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
