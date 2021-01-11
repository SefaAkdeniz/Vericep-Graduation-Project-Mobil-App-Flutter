import 'package:flutter/material.dart';

class HistoryPaymentPage extends StatefulWidget {
  @override
  _HistoryPaymentPageState createState() => _HistoryPaymentPageState();
}

class _HistoryPaymentPageState extends State<HistoryPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            title: Text("Geçmiş Ödemelerim", style: TextStyle(color: Colors.black)),
          ),
          body: Container(color: Colors.grey),
        )
    );
  }
}
