import 'package:flutter/material.dart';

class CreateAnalysisPage extends StatefulWidget{
  @override
  _CreateAnalysisPageState createState() => _CreateAnalysisPageState();

}

class _CreateAnalysisPageState extends State<CreateAnalysisPage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.deepPurpleAccent,
        ),
        Center(child: FloatingActionButton())
      ],
    );
  }
}