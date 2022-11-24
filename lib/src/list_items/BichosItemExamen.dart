import 'package:flutter/material.dart';

class BichosItemExamen extends StatelessWidget {
  final String tituloLista;
  final Function(int index) onShortClick;
  final int index;

  BichosItemExamen({
    Key? key,
    required this.tituloLista,
    required this.onShortClick,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
