import 'package:flutter/material.dart';
import 'package:vericep/api/MLServices.dart';
import 'package:vericep/models/machineLearning.dart';

class PredictPage extends StatefulWidget {
  ML currentModel;
  PredictPage(this.currentModel);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  List<Widget> widgets = List<Widget>();
  final TextEditingController txtNumber = TextEditingController();
  List<TextEditingController> controllers = [];
  Text title = Text("", style: TextStyle(color: Colors.black));

  @override
  void initState() {
    title =
        Text(widget.currentModel.name, style: TextStyle(color: Colors.black));
    setState(() {
      widgets.add(SizedBox(
        height: 25,
      ));
      for (int i = 0; i < widget.currentModel.inputs.length; i++) {
        controllers.add(TextEditingController());
        var keyboardType;
        if (widget.currentModel.inputs[i].type == "Str") {
          keyboardType = TextInputType.text;
        } else {
          keyboardType = TextInputType.number;
        }
        widgets.add(Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
          child: TextField(
            controller: controllers[i],
            keyboardType: keyboardType,
            decoration:
                InputDecoration(labelText: widget.currentModel.inputs[i].name,
                hintText: widget.currentModel.inputs[i].description),
          ),
        ));
      }
      widgets.add(Padding(
        padding: const EdgeInsets.all(25.0),
        child: RaisedButton(
          color: Colors.amberAccent,
          child: Text("Tahmini Oluştur."),
          onPressed: () {
            if (validForm()) {
              Map body = {};
              for (int i = 0; i < widget.currentModel.inputs.length; i++) {
                body[widget.currentModel.inputs[i].parameter_name] =
                    controllers[i].text;
              }
              print(widget.currentModel.url);
              MLServices.predict(widget.currentModel.url, body).then((value) {
                print(value.result.toString());
                if (value.result == 1) {
                  _showDialog("Sonuç", value.message, context);
                  print(value.message.toString());
                } else {
                  _showDialog("Sonuç", value.message, context);
                }
              });
            }
            else{
              _showDialog("Hata", "Lütfen tüm alanları doldurunuz.", context);
            }
          },
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          title: title,
        ),
        body: Container(
          color: Colors.greenAccent,
          child: ListView(
            children: widgets,
          ),
        ),
      ),
    );
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

  bool validForm() {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.isEmpty) {
        return false;
      }
    }
    return true;
  }
}
