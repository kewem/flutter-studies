// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  // ignore: use_key_in_widget_constructors
  const Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = _transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                _transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
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
