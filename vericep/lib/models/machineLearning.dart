import 'package:vericep/models/machineLearningInputs.dart';

class ML {
  int id;
  String name;
  String url;
  String description;
  int inputCount;
  List<MLInput> inputs = List<MLInput>();

  ML(this.id, this.name, this.url, this.description, this.inputCount,
      this.inputs);

  ML.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    url = json["url"];
    description = json["description"];
    inputCount = json["inputCount"];
  }
}
