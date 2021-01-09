class CardCredit {
  int id;
  String name;
  String card_number;
  String expiration_date_month;
  String expiration_date_year;
  String cvc;

  CardCredit.fromJson(Map json) {
    id = json["id"];
    name = json["name"].toString().toUpperCase();
    card_number = maskCardNumber(json["card_number"]);
    expiration_date_month = maskExpDateMonth(json["expiration_date_month"]);
    expiration_date_year = json["expiration_date_year"];
    cvc = json["cvc"];
  }

  String maskCardNumber(String o) {
    String maskedNumer = o.substring(0, 4) +
        " " +
        o.substring(4, 8) +
        " " +
        o.substring(8, 12) +
        " " +
        o.substring(12, 16);
    return maskedNumer;
  }

  String maskExpDateMonth(String expDateMonth) {
    if (expDateMonth.length == 1) {
      return "0" + expDateMonth;
    } else {
      return expDateMonth;
    }
  }
}
