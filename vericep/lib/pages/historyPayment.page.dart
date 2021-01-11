import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:vericep/api/paymentServices.dart';
import 'package:vericep/models/payment.dart';

class HistoryPaymentPage extends StatefulWidget {
  int id;
  HistoryPaymentPage(this.id);

  @override
  _HistoryPaymentPageState createState() => _HistoryPaymentPageState();
}

class _HistoryPaymentPageState extends State<HistoryPaymentPage> {
  List<Payment> payments;
  int paymentCount = 0;
  Text txtTotalPaymentPrice = Text("");

  @override
  void initState() {
    var paymentsFuture = PaymentServices.getAll(widget.id.toString());
    paymentsFuture.then((value) {
      setState(() {
        paymentCount = value["paymentCount"];
        txtTotalPaymentPrice =
            Text("Toplam yapılan ödeme: " + value["totalPaymentPrice"] + " TL");
        payments = value["payments"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        title: Text("Geçmiş Ödemelerim", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: paymentCount + 1,
            itemBuilder: (BuildContext context, int position) {
              if (position == 0) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Center(
                      child: txtTotalPaymentPrice,
                    ),
                  )),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                          payments[position - 1].card.card_number.toString()),
                      subtitle: Text(formatDate(payments[position - 1].date,
                          [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss])),
                      trailing: Text(payments[position - 1].amount + " TL"),
                    ),
                  ),
                );
              }
            }),
      ),
    ));
  }
}
