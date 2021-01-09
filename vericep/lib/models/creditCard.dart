class CreditCard {
  int id;
  String name;
  String card_number;
  String expiration_date_month;
  String expiration_date_year;
  String cvc;

  CreditCard.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    card_number = json["card_number"];
    expiration_date_month = json["expiration_date_month"];
    expiration_date_year = json["expiration_date_year"];
    cvc = json["cvc"];
  }
}
