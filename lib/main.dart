// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() =>
  runApp(MaterialApp(
    home: Scaffold(
      body: ListaTransferencias(),
      appBar: AppBar(
        title: Text('Transferências'),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
    )
  ));

  class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ItemTransferencia(Transferencia(283.45, 23333)),
          ItemTransferencia(Transferencia(344.00, 19093)),
          ItemTransferencia(Transferencia(3444.11, 24093)),
        ],
      );
  }
  }

  class ItemTransferencia extends StatelessWidget {

    final Transferencia _transferencia;

    const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: ListTile(
              title: Text("R\$ ${_transferencia.valor.toString()}"),
              subtitle: Text('Conta ID: ${_transferencia.numeroConta.toString()}'),
              leading: Icon(Icons.money_off,
                color: Colors.red,),
            ),
          );
  }
  }

  class Transferencia {
    final double valor;
    final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
  }