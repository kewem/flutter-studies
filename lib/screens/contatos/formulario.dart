// ignore_for_file: prefer_const_constructors

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatelessWidget {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerNome = TextEditingController();

  FormularioContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Contato"),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controllerConta,
            dica: '000000',
            rotulo: 'Número da conta',
            textInput: TextInputType.number,
          ),
          Editor(
            controlador: _controllerNome,
            dica: 'João da Silva',
            rotulo: 'Nome completo',
            icone: Icons.people_alt,
            textInput: TextInputType.text,
          ),
          ElevatedButton(
              onPressed: () {
                criaContato(context);
              },
              child: Text("Confirmar")),
        ],
      ),
    );
  }

  void criaContato(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerConta.text);
    final String? nome = _controllerNome.text;
    if (numeroConta != null && nome != null) {
      final contatoCriado = Contato(nome, numeroConta);
      Navigator.pop(context, contatoCriado);
    }
  }
}