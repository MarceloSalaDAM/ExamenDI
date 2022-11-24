import 'package:cloud_firestore/cloud_firestore.dart';

class BichosExamen {
  final String? tipo;
  final String? equipo;
  final String? anio;
  final String? image;

  BichosExamen({
    this.tipo = "",
    this.equipo = "",
    this.anio = "",
    this.image = "",
  });

  factory BichosExamen.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BichosExamen(
        tipo: data?['tipo'], equipo: data?['equipo'], anio: data?['anio'], image: data?['image']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (tipo != null) "tipo": tipo,
      if (equipo != null) "equipo": equipo,
      if (anio != null) "anio": anio,
      if (image != null) "image": image,
    };
  }
}
