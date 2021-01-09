class MLInput {
  int id;
  String name;
  String type;
  String description;

  MLInput(this.id, this.name, this.type, this.description);

  MLInput.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    description = json["description"];
  }
}
