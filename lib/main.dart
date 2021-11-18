// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controllerConta,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Número da conta", hintText: "0000000"),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
                controller: _controllerValor,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Valor",
                    hintText: "R\$ 0.00"),
                keyboardType: TextInputType.number),
          ),
          ElevatedButton(
              onPressed: () {
                final int? numeroConta = int.tryParse(_controllerConta.text);
                final double? valor = double.tryParse(_controllerValor.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
              child: Text("Confirmar")),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(283.45, 23333)),
          ItemTransferencia(Transferencia(344.00, 19093)),
          ItemTransferencia(Transferencia(3444.11, 24093)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  // ignore: use_key_in_widget_constructors
  const ItemTransferencia(Transferencia _transferencia)
      : _transferencia = _transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("R\$ ${_transferencia.valor.toString()}"),
        subtitle: Text('Conta ID: ${_transferencia.numeroConta.toString()}'),
        leading: Icon(
          Icons.money_off,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferência: {valor: $valor, numeroConta: $numeroConta}';
  }
}
