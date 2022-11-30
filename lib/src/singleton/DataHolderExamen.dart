import 'package:examen_din1/src/firebase_objects/BichosExamen.dart';
import 'package:examen_din1/src/firebase_objects/UsuarioExamen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase_objects/FbAdminExamen.dart';

class DataHolderExamen {

/*  El DATAHOLDER nos sirve para la descarga del perfil y
  los elementos del dicho perfil*/

  static final DataHolderExamen _dataHolderExamen = new DataHolderExamen._internal();

  String sCOLLECTIONS_BICHOS_NAME = "bichos";

  String sMensaje = "";
  UsuarioExamen usuario=UsuarioExamen();
  BichosExamen selectedBicho= BichosExamen();
  FbAdminExamen fbAdminExamen = FbAdminExamen();


  DataHolderExamen._internal() {
    sMensaje="HOLA";

  }

  factory DataHolderExamen() {
    return _dataHolderExamen;
  }

  Future<void> descargarMIPerfil() async {
    usuario = await fbAdminExamen
        .descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as UsuarioExamen;
  }

  Future<void> descargarPerfilGenerico(String? idPerfil) async {
    await fbAdminExamen.descargarPerfil(idPerfil) as UsuarioExamen;
  }

  bool isMIPerfilDownloaded() {
    return usuario != null;
  }
}
