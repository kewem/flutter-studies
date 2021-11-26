// ignore_for_file: prefer_const_constructors

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controllerConta,
            dica: '0000',
            rotulo: 'Número da conta',
          ),
          Editor(
            controlador: _controllerValor,
            dica: 'R\$ 00.00',
            rotulo: 'Valor',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
              onPressed: () {
                criaTransferencia(context);
              },
              child: Text("Confirmar")),
        ],
      ),
    );
  }

  void criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerConta.text);
    final double? valor = double.tryParse(_controllerValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}