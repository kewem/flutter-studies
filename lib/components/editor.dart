// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final TextInputType textInput;

  // ignore: use_key_in_widget_constructors
  const Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      required this.textInput,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: textInput,
      ),
    );
  }
}