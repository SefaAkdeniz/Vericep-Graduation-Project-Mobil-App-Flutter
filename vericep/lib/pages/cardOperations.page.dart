import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:vericep/models/creditCard.dart';

class CardOperationsPage extends StatefulWidget {
  CardCredit currentCard;
  CardOperationsPage(this.currentCard);

  @override
  _CardOperationsPageState createState() => _CardOperationsPageState();
}

class _CardOperationsPageState extends State<CardOperationsPage> {
  bool showBackSide = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          title: Text("İşlem Yap", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
            color: Colors.orangeAccent,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CreditCard(
                    cardNumber: widget.currentCard.card_number,
                    cardExpiry: widget.currentCard.expiration_date_month +
                        "/" +
                        widget.currentCard.expiration_date_year,
                    cardHolderName: widget.currentCard.name,
                    bankName: "Credit Card",
                    showBackSide: showBackSide,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    cvv: widget.currentCard.cvc,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      children: [
                        ListTile(
                          title: TextField(
                            onChanged: (value) {
                              if (value.length == 3) {
                                if (value == widget.currentCard.cvc) {
                                  setState(() {
                                    showBackSide = true;
                                  });
                                }
                              } else {
                                setState(() {
                                  showBackSide = false;
                                });
                              }
                            },
                            maxLength: 3,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: "Onay CVC",
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                          subtitle: TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: "Miktar",
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: const Text('Bakiye Yükle'),
                            color: Colors.orangeAccent,
                            splashColor: Colors.redAccent,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: RaisedButton(
                    child: const Text('Kayıtlı kartlardan kaldır'),
                    color: Colors.red,
                    splashColor: Colors.redAccent,
                    onPressed: () {},
                  ),
                )
              ],
            )),
      ),
    );
  }
}
