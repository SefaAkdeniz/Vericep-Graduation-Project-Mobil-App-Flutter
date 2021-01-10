import 'package:flutter/material.dart';
import 'package:vericep/models/user.dart';

class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLastName = TextEditingController();
  final TextEditingController txtMail = TextEditingController();
  final TextEditingController txtOldPassword = TextEditingController();
  final TextEditingController txtNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: Image.network(
                'https://cdn.iconscout.com/icon/free/png-256/avatar-380-456332.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "Kullanıcı Adı"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "İsim"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "Soyisim"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "E-Posta"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: RaisedButton(
            child: const Text('Bilgilerimi Güncelle'),
            color: Colors.blue,
            splashColor: Colors.redAccent,
            onPressed: () {
              // do something
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "Eski Şifre"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            decoration: InputDecoration(labelText: "Yeni Şifre"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: RaisedButton(
            child: const Text('Şifremi Güncelle'),
            color: Colors.blue,
            splashColor: Colors.redAccent,
            onPressed: () {
              // do something
            },
          ),
        ),
      ],
    );
  }
}
