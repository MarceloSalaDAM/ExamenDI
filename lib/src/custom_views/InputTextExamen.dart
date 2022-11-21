//En este fichero crearemos los input text que usaremos a lo largo de nuetsra aplicación

import 'package:flutter/material.dart';

class IPExamen extends StatelessWidget {
  final String titulo;
  final String textoGuia;
  final bool contra;
  final TextEditingController myController = TextEditingController(text: " ");

  IPExamen({
    Key? key,
    this.titulo = " ",
    this.textoGuia = " ",
    this.contra = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
