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
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLastName = TextEditingController();
  final TextEditingController txtMail = TextEditingController();

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
                InputUsernameRegister(txtUsername),
                InputPasswordRegister(txtPassword),
                InputName(txtName),
                InputLastName(txtLastName),
                InputMail(txtMail),
                ButtonRegister(txtUsername,txtPassword,txtName,txtLastName,txtMail),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
