import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/creditCard.dart';
import 'package:vericep/models/response.dart';

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
    List<CardCredit> listCreditCard = List<CardCredit>();
    for (int i = 0; i < json["cardCount"]; i++) {
      listCreditCard.add(CardCredit.fromJson(json["cards"][i]));
    }
    if (response.statusCode == 200) {
      return listCreditCard;
    } else {
      throw Exception('Failed request.');
    }
  }

  static deleteCard(String id) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/deleteCard/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'card_id': id,
      }),
    );
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed request.');
    }
  }

  static addCard(Map body) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/addCard/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed request.');
    }
  }
}
