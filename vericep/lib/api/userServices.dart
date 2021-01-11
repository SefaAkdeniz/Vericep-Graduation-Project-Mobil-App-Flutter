import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/response.dart';
import 'package:vericep/models/user.dart';

class UserServices {
  static Future<Response> register(Map body) async {
    final http.Response response =
        await http.post('http://10.0.2.2:8000/user/register/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed register.');
    }
  }

  static Future<Map> signIn(Map body) async {
    final http.Response response =
        await http.post('http://10.0.2.2:8000/user/login/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["result"] == 0) {
        return {"result": jsonDecode(response.body)["result"], "userInfo": ""};
      }
      return {
        "result": jsonDecode(response.body)["result"],
        "userInfo": User.fromJson(jsonDecode(response.body)["userInfo"])
      };
    } else {
      throw Exception('Failed login.');
    }
  }

  static Future<Response> updateAccount(Map body) async {
    print(body);
    final http.Response response =
        await http.post('http://10.0.2.2:8000/user/updateAccount/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed update.');
    }
  }

  Future<User> getAccountInfo(String id) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:8000/user/getAccountInfo/',
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
        var user = User.fromJson(json["userInfo"]);
        user.username = json["userInfo"]["username"];
        return user;
      } else {
        throw Exception(json["Sisteme kayıtlı kullanıcı bulunamadı."]);
      }
    } else {
      throw Exception('Failed request.');
    }
  }
}
