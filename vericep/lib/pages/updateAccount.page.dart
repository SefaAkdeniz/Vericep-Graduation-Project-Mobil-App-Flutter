import 'package:flutter/material.dart';

class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(),
        ),
      ],
    );
  }
}
