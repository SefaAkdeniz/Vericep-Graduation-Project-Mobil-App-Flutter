import 'package:flutter/material.dart';

class PredictPage extends StatefulWidget {
  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
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
          title:
              Text("Tahmin Oluşturma Ekranı", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
