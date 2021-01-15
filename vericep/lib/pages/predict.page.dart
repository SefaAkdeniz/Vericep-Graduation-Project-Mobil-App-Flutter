import 'package:flutter/material.dart';
import 'package:vericep/models/machineLearning.dart';

class PredictPage extends StatefulWidget {
  ML currentModel;
  PredictPage(this.currentModel);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  List<Widget> widgets = List<Widget>();
  Text title = Text("", style: TextStyle(color: Colors.black));

  @override
  void initState() {
    title =
        Text(widget.currentModel.name, style: TextStyle(color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          title: title,
        ),
        body: Container(
          color: Colors.greenAccent,
          child: ListView(
            children: widgets,
          ),
        ),
      ),
    );
  }
}
