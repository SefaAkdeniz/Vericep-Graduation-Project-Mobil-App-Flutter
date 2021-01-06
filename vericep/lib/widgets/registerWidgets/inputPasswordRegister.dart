import 'package:flutter/material.dart';

class InputPasswordRegister extends StatefulWidget {
  @override
  _InputPasswordRegisterState createState() => _InputPasswordRegisterState();
}

class _InputPasswordRegisterState extends State<InputPasswordRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Şifre',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
