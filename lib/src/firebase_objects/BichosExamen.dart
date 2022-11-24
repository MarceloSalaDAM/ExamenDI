import 'package:cloud_firestore/cloud_firestore.dart';

class BichosExamen {
  final String? tipo;

  BichosExamen({
    this.tipo = "",
  });

  factory BichosExamen.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BichosExamen(tipo: data?['tipo']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (tipo != null) "tipo": tipo,
    };
  }
}
