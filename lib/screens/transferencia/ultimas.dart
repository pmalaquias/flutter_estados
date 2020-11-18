import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Últimas Trasnferências';

class UltimasTrasferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int tamanho = _quantidade < 2 ? _quantidade : 2;

            if (tamanho == 0) return SemTransferenciaCadastrada();

            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: tamanho,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemTransferencia(_ultimasTransferencias[index]);
              },
            );
          },
        ),
        RaisedButton(
          color: Colors.green,
          child: Text('Ver todas transferência'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaTranferencias();
                },
              ),
            );
          },
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
