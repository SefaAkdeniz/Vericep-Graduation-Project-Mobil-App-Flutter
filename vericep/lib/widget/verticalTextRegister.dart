import 'package:flutter/material.dart';

class VerticalTextRegister extends StatefulWidget {
  @override
  _VerticalTextRegisterState createState() => _VerticalTextRegisterState();
}

class _VerticalTextRegisterState extends State<VerticalTextRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            'Kaydol',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
