import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/firebase_objects/UsuarioExamen.dart';

class FbAdminExamen {
  FbAdminExamen() {}

  Future<UsuarioExamen?> descargarPerfil(String? idPerfil) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("usuarios").doc(idPerfil).withConverter(
        fromFirestore: UsuarioExamen.fromFirestore,
        toFirestore: (UsuarioExamen usuario, _) => usuario.toFirestore());

    final docSnap = await docRef.get();
    return docSnap.data();
  }
}
