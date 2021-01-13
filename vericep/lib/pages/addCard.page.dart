import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:vericep/api/creditCardServices.dart';
import 'package:vericep/models/creditCard.dart';

class AddCardPage extends StatefulWidget {
  String currentUserId;
  AddCardPage(this.currentUserId);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController txtNumber = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtExpDate = TextEditingController();
  final TextEditingController txtCVC = TextEditingController();
  CardCredit newCard = CardCredit();
  bool showBackSide = false;
  @override
  void initState() {
    newCard.id = int.tryParse(widget.currentUserId);
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
              title: Text("Yeni Kart Kaydet",
                  style: TextStyle(color: Colors.black)),
            ),
            body: Container(
              color: Colors.blueGrey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: CreditCard(
                      cardNumber: newCard.maskCardNumber(newCard.card_number),
                      cardExpiry: newCard.expiration_date_month +
                          "/" +
                          newCard.expiration_date_year,
                      cardHolderName: newCard.name.toUpperCase(),
                      bankName: "Credit Card",
                      showBackSide: showBackSide,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      cvv: newCard.cvc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 15.0, right: 15.0),
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                                controller: txtNumber,
                                onTap: () {
                                  setState(() {
                                    showBackSide = false;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    newCard.card_number = value;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                maxLength: 16,
                                decoration: InputDecoration(
                                    labelText: "Kart Numarası")),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                                controller: txtName,
                                onTap: () {
                                  setState(() {
                                    showBackSide = false;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    newCard.name = value;
                                  });
                                },
                                decoration:
                                    InputDecoration(labelText: "Adı Soyadı")),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                                controller: txtExpDate,
                                onTap: () {
                                  setState(() {
                                    showBackSide = false;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    if (value.length < 3) {
                                      newCard.expiration_date_month = value;
                                    } else if (value.length == 4) {
                                      newCard.expiration_date_year = value[3];
                                    } else if (value.length == 5) {
                                      newCard.expiration_date_year =
                                          value.substring(3, 5);
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: "Son Kullanma Tarihi (AA/YY)")),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                                controller: txtCVC,
                                onTap: () {
                                  setState(() {
                                    showBackSide = true;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    newCard.cvc = value;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                decoration: InputDecoration(
                                    labelText: "Güvenlik Kodu (CVV)")),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: RaisedButton(
                              child: Text("Kartı Kaydet"),
                              onPressed: () {
                                if (validForm()) {
                                  CreditCardServices.addCard(
                                          newCard.toJsonAddCard())
                                      .then((value) {
                                    print(value.result.toString());
                                    if (value.result == 1) {
                                      Navigator.of(context).pop(true);
                                      _showDialog(
                                          "Tebrikler", value.message, context);
                                      print(value.message.toString());
                                    } else {
                                      _showDialog(
                                          "Maalesef", value.message, context);
                                    }
                                  });
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  void _showDialog(title, content, BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool validForm() {
    if (txtExpDate.text == "") {
      _showDialog("Maalesef", "Lütfen son kullanma tarihini giriniz.", context);
      return false;
    } else if (txtCVC.text == "") {
      _showDialog("Maalesef", "Lütfen CVV kodunu giriniz.", context);
      return false;
    } else if (txtNumber.text == "") {
      _showDialog("Maalesef", "Lütfen kart numarasını giriniz.", context);
      return false;
    } else if (txtName.text == "") {
      _showDialog("Maalesef", "Lütfen isim soyisim giriniz.", context);
      return false;
    }
    return true;
  }
}
