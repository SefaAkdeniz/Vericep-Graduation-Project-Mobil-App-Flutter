import 'package:flutter/material.dart';
import 'package:vericep/api/UserServices.dart';
import 'package:vericep/models/user.dart';

class ButtonLogin extends StatefulWidget {
  TextEditingController txtUsername;
  TextEditingController txtPassword;
  ButtonLogin(this.txtUsername, this.txtPassword);

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.green[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {
            login();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'GİRİŞ',
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    UserServices.signIn(
            User.forLogin(widget.txtUsername.text, widget.txtPassword.text)
                .toJsonLogin())
        .then((value) {
      if (value["result"] == 1) {
        var user = value["userInfo"];
        _showDialog("Tebrikler.", "Giriş Yapıldı");
      } else {
        _showDialog("Maalesef işlem başarısız.",
            "Sisteme kayıtlı kullanıcı bulunamadı");
      }
    });
  }

  void _showDialog(title, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
