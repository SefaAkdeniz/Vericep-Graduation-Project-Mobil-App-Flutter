import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/response.dart';

class UserServices {
  static Future<Response> register(Map body) async {
    final http.Response response =
        await http.post('http://10.0.2.2:8000/user/register/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 201) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed register.');
    }
  }
}
