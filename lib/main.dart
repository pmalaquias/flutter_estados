import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/dashbord/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/saldo.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      ),
    ],
    //create:  ,
    child: Bytebank(),
  ));
  //findAll().then((contacts) => debugPrint(contacts.toString()));
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
