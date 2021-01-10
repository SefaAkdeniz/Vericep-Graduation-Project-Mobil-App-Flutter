import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alerts {
  void showAlertWithImage(context, title, message, image) {
    Alert(
      context: context,
      title: title,
      desc: message,
      image: Image.asset(image),
    ).show();
  }
}
