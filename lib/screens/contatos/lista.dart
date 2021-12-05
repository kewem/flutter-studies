// ignore_for_file: prefer_const_constructors

import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contatos/formulario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  final List<Contato> _contatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          final contato = _contatos[index];
          return ItemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioContato();
          }));
          future.then((contatoRecebido) {
            if (contatoRecebido != null) {
              setState(() {
                _contatos.add(contatoRecebido);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  final Contato _contato;

  // ignore: use_key_in_widget_constructors
  const ItemContato(Contato _contato)
      : _contato = _contato;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_contato.nome.toString()),
        subtitle: Text('Conta ID: ${_contato.numeroConta.toString()}'),
        leading: Icon(
          Icons.people,
          color: Colors.black,
        ),
      ),
    );
  }
}