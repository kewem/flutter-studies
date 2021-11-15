// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() =>
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("R\$ 100,00"),
              subtitle: Text('Ifood: Taki Kando'),
              leading: Icon(Icons.money_off),

            ),
          ),
          Card(
            child: ListTile(
              title: Text("R\$ 458,00"),
              subtitle: Text('Venda: Conjunto Del Rey'),
              leading: Icon(Icons.monetization_on),

            ),
          ),
          Card(
            child: ListTile(
              title: Text("R\$ 356,00"),
              subtitle: Text('Contas fixas: Água'),
              leading: Icon(Icons.money_off),

            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Transferências'),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
    )
  ));