import 'package:examen_din1/src/firebase_objects/BichosExamen.dart';
import 'package:examen_din1/src/firebase_objects/UsuarioExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataHolderExamen {
  static final DataHolderExamen _dataHolderExamen = new DataHolderExamen._internal();

  String sCOLLECTIONS_BICHOS_NAME = "bichos";

  String sMensaje = "";
  UsuarioExamen usuario=UsuarioExamen();
  BichosExamen selectedBicho= BichosExamen();


  DataHolderExamen._internal() {
    sMensaje="HOLA";

  }

  factory DataHolderExamen() {
    return _dataHolderExamen;
  }

  Future<void> descargarMIPerfil() async {
    usuario = await fbAdmin2
        .descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as UsuarioExamen;
  }

  Future<void> descargarPerfilGenerico(String? idPerfil) async {
    await fbAdmin2.descargarPerfil(idPerfil) as UsuarioExamen;
  }

  bool isMIPerfilDownloaded() {
    return usuario != null;
  }
}
