import 'package:flutter/material.dart';

class InputMail extends StatefulWidget {
  final TextEditingController txtMail;
  InputMail(this.txtMail);

  @override
  _InputMailState createState() => _InputMailState();
}

class _InputMailState extends State<InputMail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: widget.txtMail,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightGreenAccent,
            labelText: 'E-Posta',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
