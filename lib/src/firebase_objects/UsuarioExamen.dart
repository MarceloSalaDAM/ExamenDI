import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioExamen {
  /* Declaracion de los atributos de la clase Usuarios,
  para la conexion con el Firebase*/
  final String? nombre;
  final String? apellidos;

  UsuarioExamen({
    this.nombre = " ",
    this.apellidos = " ",
  });

  factory UsuarioExamen.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UsuarioExamen(
        nombre: data?['nombre'], apellidos: data?['apellidos']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos,
    };
  }
}
