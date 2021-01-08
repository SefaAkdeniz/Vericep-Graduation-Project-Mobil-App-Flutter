import 'package:flutter/material.dart';
import 'package:vericep/api/UserServices.dart';
import 'package:vericep/models/response.dart';
import 'package:vericep/models/user.dart';
import 'package:vericep/pages/login.page.dart';

class ButtonRegister extends StatefulWidget {
  final List<TextEditingController> txtFormInputs;
  ButtonRegister(this.txtFormInputs);

  @override
  _ButtonRegisterState createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.purple[300],
            blurRadius: 10.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          onPressed: () {
            register();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'KAYIT',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    UserServices.register(User.forRegister(
                widget.txtFormInputs[0].text,
                widget.txtFormInputs[2].text,
                widget.txtFormInputs[3].text,
                widget.txtFormInputs[4].text,
                widget.txtFormInputs[1].text)
            .toJsonRegister())
        .then((value) {
      print(value.message);
      if (value.result == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        _showDialog("Hoşgeldin.", value.message);
      } else {
        _showDialog("Maalesef işlem başarısız.", value.message);
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
