import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {
  static Future register(Map body) async {
    final http.Response response =
        await http.post('http://127.0.0.1:8000/user/register/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
