class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
      this.valor,
      this.numeroConta,
      );

  String toStringValor(){
    final String value = valor.toStringAsFixed(2);
    
    return 'R\$ $value';
  }

  String toStringConta(){
    return 'Conta: $numeroConta';
  }

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}