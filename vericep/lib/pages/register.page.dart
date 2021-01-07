import 'package:flutter/material.dart';
import 'package:vericep/widget/buttonRegister.dart';
import 'package:vericep/widget/inputLastName.dart';
import 'package:vericep/widget/inputMail.dart';
import 'package:vericep/widget/inputUsernameRegister.dart';
import 'package:vericep/widget/inputName.dart';
import 'package:vericep/widget/inputPasswordRegister.dart';
import 'package:vericep/widget/verticalTextRegister.dart';
import 'package:vericep/widget/textRegister.dart';
import 'package:vericep/widget/userOld.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.purpleAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    VerticalTextRegister(),
                    TextRegister(),
                  ],
                ),
                InputUsernameRegister(),
                InputPasswordRegister(),
                InputName(),
                InputLastName(),
                InputMail(),
                ButtonRegister(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}