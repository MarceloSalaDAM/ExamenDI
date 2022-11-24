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
    throw ListTile(
        title: Text(tituloLista),
        leading: Image(
          image: new AssetImage("assets/cr7.png"),
        ),
        trailing: Icon(Icons.next_plan_outlined),
        onTap: () {
          onShortClick(index);
        });
  }
}
