import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/creditCard.dart';

class CreditCardServices {
  Future getListCard(String id) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/listCard/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': id,
      }),
    );
    var json = jsonDecode(response.body);
    List<CreditCard> listCreditCard = List<CreditCard>();
    for (int i = 0; i < json["cardCount"]; i++) {
      listCreditCard.add(CreditCard.fromJson(json["cards"][i]));
    }
    print(listCreditCard.length);
    if (response.statusCode == 200) {
      return listCreditCard;
    } else {
      throw Exception('Failed request.');
    }
  }
}
