import 'package:vericep/models/response.dart';
import 'package:http/http.dart' as http;

class AnalysisServices {
  static Future<Response> createAnalysis(user_id,path) async {
    var headers = {
      'Cookie':
          'csrftoken=dbdRCj94IfwRwxzSypZJ0vrQV7y5Ul6NsREq0UshABHnhL72NfLByjAKY6z56SsF'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/analysis/create/'));
    request.fields.addAll({'user_id': user_id});
    request.files
        .add(await http.MultipartFile.fromPath('data', 'path'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
