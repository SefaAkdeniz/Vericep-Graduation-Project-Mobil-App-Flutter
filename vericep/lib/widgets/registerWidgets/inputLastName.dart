import 'package:flutter/material.dart';

class InputLastName extends StatefulWidget {
  @override
  _InputLastNameState createState() => _InputLastNameState();
}

class _InputLastNameState extends State<InputLastName> {
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
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightGreenAccent,
            labelText: 'Soyisim',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
