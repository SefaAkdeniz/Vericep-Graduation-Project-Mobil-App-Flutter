import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:vericep/api/userServices.dart';
import 'package:vericep/models/user.dart';
import 'package:vericep/widgets/alert.dart';

class UpdateAccountPage extends StatefulWidget {
  int currentUserId;
  String oldPassword;

  UpdateAccountPage(this.currentUserId, this.oldPassword);

  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  var userServices = UserServices();
  User currentUser = User();
  var alerts = Alerts();
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLastName = TextEditingController();
  final TextEditingController txtMail = TextEditingController();
  final TextEditingController txtOldPassword = TextEditingController();
  final TextEditingController txtNewPassword = TextEditingController();
  Widget createDateLabel = Text("");

  @override
  void initState() {
    var userFuture =
        userServices.getAccountInfo(widget.currentUserId.toString());
    userFuture.then((value) {
      setState(() {
        this.currentUser = value;
        this.txtName.text = currentUser.first_name;
        this.txtLastName.text = currentUser.last_name;
        this.txtUsername.text = currentUser.username;
        this.txtMail.text = currentUser.email;
        DateTime dateTime = DateTime.parse(currentUser.date_joined);
        createDateLabel = Text(
            "Hesap Oluşturulma tarihi: " +
                formatDate(dateTime,
                    [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
          controller: txtUsername,
          decoration: InputDecoration(labelText: "Kullanıcı Adı"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextField(
          controller: txtName,
          decoration: InputDecoration(labelText: "İsim"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextField(
          controller: txtLastName,
          decoration: InputDecoration(labelText: "Soyisim"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextField(
          controller: txtMail,
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
            updateInfo();
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextField(
          controller: txtOldPassword,
          decoration: InputDecoration(labelText: "Eski Şifre"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextField(
          controller: txtNewPassword,
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
            updatePassword(context);
          },
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 30, left: 15.0, right: 15.0),
          child: Center(
            child: createDateLabel,
          ))
    ]);
  }

  void updatePassword(BuildContext context) {
    if (widget.oldPassword != txtOldPassword.text) {
      _showDialog("Başarısız", "Eski şifreniz yanlış.", context);
    } else {
      UserServices.updateAccount(User.forUpdateAccount(
        currentUser.id,
        currentUser.username,
        currentUser.first_name,
        currentUser.last_name,
        currentUser.email,
        txtNewPassword.text,
      ).toJsonUpdate())
          .then((value) {
        if (value.result == 1) {
          _showDialog("Tebrikler", value.message, context);
        } else {
          _showDialog("Başarısız", value.message, context);
        }
      });
    }
  }

  void updateInfo() {
    UserServices.updateAccount(User.forUpdateAccount(
      currentUser.id,
      txtUsername.text,
      txtName.text,
      txtLastName.text,
      txtMail.text,
      widget.oldPassword,
    ).toJsonUpdate())
        .then((value) {
      if (value.result == 1) {
        _showDialog("Tebrikler", value.message, context);
      } else {
        _showDialog("Başarısız", value.message, context);
      }
    });
  }

  void _showDialog(title, content, BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
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
