import 'package:bytebank/components/saldo_card.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.all(8.0),
                child: Text('Receber depósito'),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioDeposito();
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('Nova Transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioTransferencia();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          UltimasTrasferencias(),
        ],
      ),
    );
  }
}
