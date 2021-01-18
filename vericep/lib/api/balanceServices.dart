import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/response.dart';

class BalanceServices {
  Future getBalance(String id) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/getBalance/',
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
        return json["amaount"];
      } else {
        return "0.00";
      }
    } else {
      throw Exception('Failed request.');
    }
  }

  static Future<Response> setBalance(user_id, process_price) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/payment/setBalance/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'user_id': user_id, 'process_price': process_price}),
    );
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed request.');
    }
  }
}
