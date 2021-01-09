import 'package:flutter/material.dart';
import 'package:vericep/api/MLServices.dart';
import 'package:vericep/models/machineLearning.dart';

class MLPage extends StatefulWidget {
  @override
  _MLPageState createState() => _MLPageState();
}

class _MLPageState extends State<MLPage> {
  var mlService = MLServices();
  List<ML> mls;
  int mlCount = 0;

  @override
  void initState() {
    var mlsFuture = MLServices.getAll();
    mlsFuture.then((value) {
      setState(() {
        this.mls = value;
        this.mlCount = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mlCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(this.mls[position].name),
              subtitle: Text(this.mls[position].description),
              trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right)),
            ),
          );
        });
  }
}
