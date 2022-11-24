import 'package:cloud_firestore/cloud_firestore.dart';

class BichosExamen {
  final String? tipo;
  final String? equipo;
  final String? anio;

  BichosExamen({
    this.tipo = "",
    this.equipo = "",
    this.anio = "",
  });

  factory BichosExamen.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BichosExamen(
        tipo: data?['tipo'], equipo: data?['equipo'], anio: data?['anio']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (tipo != null) "tipo": tipo,
      if (equipo != null) "equipo": equipo,
      if (anio != null) "anio": anio,
    };
  }
}
