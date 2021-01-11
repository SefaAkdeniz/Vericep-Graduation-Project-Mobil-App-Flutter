class User {
  int id;
  String first_name;
  String last_name;
  String email;
  String username;
  String password;
  String last_login;
  String date_joined;

  User.forLogin(this.username, this.password);
  User.forRegister(this.username, this.first_name, this.last_name, this.email,
      this.password);
  User.forUpdateAccount(this.id, this.username, this.first_name, this.last_name,
      this.email, this.password);

  User();

  User.fromJson(Map json) {
    id = json["id"];
    first_name = json["first_name"];
    last_name = json["last_name"];
    email = json["email"];
    last_login = json["last_login"];
    date_joined = json["date_joined"];
  }

  Map toJsonLogin() {
    return {"username": username, "password": password};
  }

  Map toJsonRegister() {
    return {
      "username": isNullCheck(username),
      "first_name": isNullCheck(first_name),
      "last_name": isNullCheck(last_name),
      "email": isNullCheck(email),
      "password": isNullCheck(password)
    };
  }

  Map toJsonUpdate() {
    return {
      "user_id": id.toString(),
      "username": isNullCheck(username),
      "first_name": isNullCheck(first_name),
      "last_name": isNullCheck(last_name),
      "email": isNullCheck(email),
      "password": isNullCheck(password)
    };
  }

  String isNullCheck(String value) {
    if (value.length < 1) {
      return " ";
    } else {
      return value;
    }
  }
}
