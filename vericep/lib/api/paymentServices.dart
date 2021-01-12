import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/payment.dart';
import 'package:vericep/models/response.dart';

class PaymentServices {
  static Future<Map> getAll(id) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/listPastPayments/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': id,
      }),
    );
    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (json["result"] == 1) {
        var payments = List<Payment>();

        for (int i = 0; i < json["paymentCount"]; i++) {
          payments.add(Payment.fromJson(json["payments"][i]));
        }

        return {
          "paymentCount": json["paymentCount"],
          "totalPaymentPrice": json["totalPaymentPrice"],
          "payments": payments
        };
      }
      throw Exception('Failed request.');
    } else {
      throw Exception('Failed request.');
    }
  }

  static Future<Response> doPayment(
      user_id, add_amaount, card_id, verification_cvc) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/doPayment/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': user_id,
        'add_amaount': add_amaount,
        'card_id': card_id.toString(),
        'verification_cvc': verification_cvc
      }),
    );
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed login.');
    }
  }
}
