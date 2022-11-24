import 'package:cloud_firestore/cloud_firestore.dart';

class Cr7InfoExamen {
  final String? text;
  final String? usuario;
  final Timestamp? time;

  Cr7InfoExamen({
    this.text = "",
    this.usuario = "",
    this.time,
  });

  factory Cr7InfoExamen.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Cr7InfoExamen(
        text: data?['text'], usuario: data?['usuario'], time: data?['time']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (text != null) "text": text,
      if (usuario != null) "usuario": usuario,
      if (time != null) "time": time,
    };
  }
}