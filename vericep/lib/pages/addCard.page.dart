import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:vericep/models/creditCard.dart';

class AddCardPage extends StatefulWidget {
  String currentUserId;
  AddCardPage(this.currentUserId);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  CardCredit newCard = CardCredit();
  bool showBackSide = false;
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
                                onTap: () {
                                  setState(() {
                                    showBackSide = false;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: "Son Kullanma Tarihi (AA/YY)")),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                                onTap: () {
                                  setState(() {
                                    showBackSide = true;
                                  });
                                },
                                onChanged: (value){
                                  setState(() {
                                    newCard.cvc=value;
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
                                print(newCard.name);
                                print(newCard.card_number);
                                print(newCard.cvc);
                                print(newCard.expiration_date_month);
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
}
