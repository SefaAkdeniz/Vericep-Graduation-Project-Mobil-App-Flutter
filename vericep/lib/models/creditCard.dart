class CardCredit {
  int id;
  String name;
  String card_number;
  String expiration_date_month;
  String expiration_date_year;
  String cvc;

  CardCredit() {
    this.name = "AD SOYAD";
    this.card_number = "";
    this.expiration_date_month = "AA";
    this.expiration_date_year = "YY";
    this.cvc = "";
  }

  CardCredit.fromJson(Map json) {
    id = json["id"];
    name = json["name"].toString().toUpperCase();
    card_number = maskCardNumber(json["card_number"]);
    expiration_date_month = maskExpDateMonth(json["expiration_date_month"]);
    expiration_date_year = json["expiration_date_year"];
    cvc = json["cvc"];
  }

  CardCredit.fromJsonRegister(Map json) {
    name = json["name"].toString().toUpperCase();
    card_number = maskCardNumber(json["card_number"]);
    expiration_date_month = maskExpDateMonth(json["expiration_date_month"]);
    expiration_date_year = json["expiration_date_year"];
    cvc = json["cvc"];
  }

  String maskCardNumber(String o) {
    String maskedNumer = "";
    for (int i = 0; i < o.length; i++) {
      if (i % 4 == 0) {
        if (i == 0) {
          maskedNumer = maskedNumer + o[i].toString();
        } else {
          maskedNumer = maskedNumer + " " + o[i].toString();
        }
      } else {
        maskedNumer = maskedNumer + o[i].toString();
      }
    }

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
