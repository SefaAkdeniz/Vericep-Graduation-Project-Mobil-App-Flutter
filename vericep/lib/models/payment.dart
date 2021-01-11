import 'package:vericep/models/creditCard.dart';

class Payment {
  int id;
  DateTime date;
  String amount;
  CardCredit card;

  Payment.fromJson(Map json) {
    id = json["id"];
    date = DateTime.parse(json["date"]);
    amount = json["amount"];
    card = CardCredit.fromJson(json["payment_card"]);
  }
}
