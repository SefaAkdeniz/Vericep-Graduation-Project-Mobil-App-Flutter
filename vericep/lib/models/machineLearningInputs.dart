class MLInput {
  int id;
  String name;
  String type;
  String description;
  String parameter_name;

  MLInput(this.id, this.name, this.type, this.description);

  MLInput.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    description = json["description"];
    parameter_name = json["parameter_name"];
  }
}
