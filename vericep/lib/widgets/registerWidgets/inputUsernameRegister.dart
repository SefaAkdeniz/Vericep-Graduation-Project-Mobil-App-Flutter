import 'package:flutter/material.dart';

class InputUsernameRegister extends StatefulWidget {
  final TextEditingController txtUsername;
  InputUsernameRegister(this.txtUsername);

  @override
  _InputUsernameRegisterState createState() => _InputUsernameRegisterState();
}

class _InputUsernameRegisterState extends State<InputUsernameRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: widget.txtUsername,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightGreenAccent,
            labelText: 'Kullanıcı Adı',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
