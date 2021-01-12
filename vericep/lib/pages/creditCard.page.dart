import 'package:flutter/material.dart';
import 'package:vericep/api/balanceServices.dart';
import 'package:vericep/api/creditCardServices.dart';
import 'package:vericep/models/creditCard.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:vericep/pages/cardOperations.page.dart';

class CreditCardPage extends StatefulWidget {
  String currentUserId;
  CreditCardPage(this.currentUserId);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  var creditCardService = CreditCardServices();
  var balanceServices = BalanceServices();
  List<CardCredit> creditCards;
  int cardCounts = 0;
  Text txtAmaount = Text("");
  String amaount;

  @override
  void initState() {
    getCard();
    getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cardCounts + 1,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
              child: Card(
                  child: Center(
                      child: Padding(
                child: txtAmaount,
                padding: const EdgeInsets.all(8.0),
              ))),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () async {
                  final boole = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardOperationsPage(
                              this.creditCards[position - 1],
                              widget.currentUserId)));
                  if (boole) {
                    getCard();
                    getBalance();
                  }
                  ;
                },
                child: CreditCard(
                  cardNumber: this.creditCards[position - 1].card_number,
                  cardExpiry:
                      this.creditCards[position - 1].expiration_date_month +
                          "/" +
                          this.creditCards[position - 1].expiration_date_year,
                  cardHolderName: this.creditCards[position - 1].name,
                  bankName: "Credit Card",
                  showBackSide: false,
                  frontBackground: CardBackgrounds.black,
                  backBackground: CardBackgrounds.white,
                ),
              ),
            );
          }
        });
  }

  getCard() {
    var cardsFuture = creditCardService.getListCard(widget.currentUserId);
    cardsFuture.then((value) {
      setState(() {
        this.creditCards = value;
        this.cardCounts = value.length;
      });
    });
  }

  void getBalance() {
    var amaountFuture = balanceServices.getBalance(widget.currentUserId);
    amaountFuture.then((value) {
      setState(() {
        txtAmaount = Text("Kullanılabilir Bakiye: " + value + " TL");
      });
    });
  }
}
