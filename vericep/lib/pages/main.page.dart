import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vericep/models/user.dart';
import 'package:vericep/pages/creditCard.page.dart';
import 'package:vericep/pages/historyPayment.page.dart';
import 'package:vericep/pages/ml.page.dart';
import 'package:vericep/pages/updateAccount.page.dart';
import 'package:vericep/widgets/loginWidgets/textLogin.dart';

class MainPage extends StatefulWidget {
  User currentUser;
  String password;

  MainPage(this.currentUser, this.password);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget currentPage = MLPage();
  var currentColor = Colors.blueAccent;
  Widget currentAddButton;
  Widget appBarButton = IconButton(icon: Icon(Icons.info));
  String currentTitle = "ML Modelleri";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(image: AssetImage('assets/logo.png')),
          ),
          actions: [appBarButton],
          title: Text(currentTitle, style: TextStyle(color: Colors.black)),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: currentColor,
          index: 1,
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
                  currentAddButton = FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add),
                    tooltip: "Yeni kart ekle.",
                  );
                  currentTitle = "Kayıtlı Kartlarım";
                  appBarButton = IconButton(
                    icon: Icon(Icons.history),
                    onPressed: () {
                      currentPage = HistoryPaymentPage();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryPaymentPage()));
                    },
                  );
                  break;
                case 1:
                  currentPage = MLPage();
                  currentColor = Colors.blueAccent;
                  currentAddButton = null;
                  currentTitle = "ML Modelleri";
                  appBarButton = IconButton(icon: Icon(Icons.info));
                  break;
                case 3:
                  currentPage =
                      UpdateAccountPage(widget.currentUser.id, widget.password);
                  currentColor = Colors.amberAccent;
                  currentAddButton = null;
                  currentTitle = "Hesabım";
                  appBarButton = IconButton(icon: Icon(Icons.exit_to_app));
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
        floatingActionButton: currentAddButton,
      ),
    );
  }
}
