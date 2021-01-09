import 'package:flutter/material.dart';
import 'package:vericep/api/creditCardServices.dart';
import 'package:vericep/models/creditCard.dart';
import 'package:awesome_card/awesome_card.dart';

class CreditCardPage extends StatefulWidget {
  String currentUserId;
  CreditCardPage(this.currentUserId);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  var creditCardService = CreditCardServices();
  List<CardCredit> creditCards;
  int cardCounts = 0;

  @override
  void initState() {
    var cardsFuture = creditCardService.getListCard(widget.currentUserId);
    cardsFuture.then((value) {
      setState(() {
        this.creditCards = value;
        this.cardCounts = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cardCounts,
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CreditCard(
              cardNumber: this.creditCards[position].card_number,
              cardExpiry: this.creditCards[position].expiration_date_month +
                  "/" +
                  this.creditCards[position].expiration_date_year,
              cardHolderName: this.creditCards[position].name,
              bankName: "Axis Bank",
              showBackSide: false,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
            ),
          );
        });
  }
}
