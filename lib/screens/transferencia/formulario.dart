import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferêcia"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controllerCampoNConta,
              rotulo: 'Número da Conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controllerCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                _criarTransferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    print("Clicou no confirmar");
    final int numeroConta = int.tryParse(_controllerCampoNConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      print("$numeroConta");
      print("$valor");

      final novaTransferencia = Transferencia(valor, numeroConta);

      debugPrint('Criando Tranferencia');

      print("$novaTransferencia");

      _atualizaEstado(context, novaTransferencia, valor);

      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final camposPreenchidos = numeroConta != null && valor != null;
    final saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          listen: false,
        ).valor;
    return camposPreenchidos && saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(
      context,
      listen: false,
    ).adiciona(novaTransferencia);

    Provider.of<Saldo>(
      context,
      listen: false,
    ).subtrai(valor);
  }
}
