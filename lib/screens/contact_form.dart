import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAccount = TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: 'FullName',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controllerAccount,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    final String name = _controllerName.text;
                    final int accountNumber =
                    int.tryParse(_controllerAccount.text);

                    final newContact = Contact(0, name, accountNumber);

                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                  child: Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}