import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vericep/models/response.dart';

class AnalysisServices {
  static Future<Response> createAnalysis(user_id, path) async {
    print(path);
    var headers = {};
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:8000/analysis/create/'));
    request.fields.addAll({'user_id': user_id});
    request.files.add(await http.MultipartFile.fromPath('data', path));

    http.StreamedResponse response = await request.send();
    final http.Response _response = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(_response.body));
    } else {
      throw Exception('Failed request.');
    }
  }
}
