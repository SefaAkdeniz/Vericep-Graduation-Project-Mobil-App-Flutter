import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vericep/models/user.dart';
import 'package:vericep/pages/creditCard.page.dart';
import 'package:vericep/pages/ml.page.dart';

class MainPage extends StatefulWidget {
  User currentUser;

  MainPage(this.currentUser);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget currentPage;
  var currentColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(image: AssetImage('assets/logo.png')),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: currentColor,
          items: <Widget>[
            Icon(Icons.credit_card_rounded, size: 30),
            Icon(Icons.android_sharp, size: 30),
            Icon(Icons.add_chart, size: 30),
            Icon(Icons.account_circle_sharp, size: 30),
          ],
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  currentPage =
                      CreditCardPage(widget.currentUser.id.toString());
                  currentColor = Colors.redAccent;
                  break;
                case 1:
                  currentPage = MLPage();
                  currentColor = Colors.blueAccent;
                  break;
              }
            });
          },
        ),
        body: Container(
          color: currentColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: currentPage,
          ),
        ),
      ),
    );
  }
}
