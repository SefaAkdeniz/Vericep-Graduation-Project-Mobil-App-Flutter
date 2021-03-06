import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/machineLearning.dart';
import 'package:vericep/models/machineLearningInputs.dart';
import 'package:vericep/models/response.dart';

class MLServices {
  static Future<List<ML>> getAll() async {
    final http.Response response =
        await http.get('http://10.0.2.2:8000/ml/', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var json = jsonDecode(response.body);
    List<ML> listML = List<ML>();
    for (int i = 0; i < json["modelCount"]; i++) {
      ML currentMl = ML.fromJson(json["models"][i]);
      for (int j = 0; j < json["models"][i]["inputCount"]; j++) {
        currentMl.inputs.add(MLInput.fromJson(json["models"][i]["inputs"][j]));
      }
      listML.add(currentMl);
    }
    if (response.statusCode == 200) {
      return listML;
    } else {
      throw Exception('Failed request.');
    }
  }

  static Future<Response> predict(url, body) async {
    final http.Response response = await http.post(
      url,
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
