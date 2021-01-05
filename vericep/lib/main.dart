import 'package:flutter/material.dart';
import 'package:vericep/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vericep',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
