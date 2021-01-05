import 'package:flutter/material.dart';

class TextRegister extends StatefulWidget {
  @override
  _TextRegisterState createState() => _TextRegisterState();
}

class _TextRegisterState extends State<TextRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                'Hesabın yoksa hesap oluşturmalısın.',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
