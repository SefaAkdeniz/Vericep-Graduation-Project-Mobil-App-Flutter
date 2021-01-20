import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vericep/api/AnalysisServices.dart';

class CreateAnalysisPage extends StatefulWidget {
  String currentUserId;
  CreateAnalysisPage(this.currentUserId);

  @override
  _CreateAnalysisPageState createState() => _CreateAnalysisPageState();
}

class _CreateAnalysisPageState extends State<CreateAnalysisPage> {
  String _fileName;
  String _path = "";
  Map<String, String> _paths;
  bool _loadingPath = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.custom;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.deepPurpleAccent,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Analiz rapor hizmeti almak için dosyalarınızdan ilgili dosyayı (.csv formatlı) seçmeniz yeterlidir. Seçmeniz durumunda hesabınıza kayıtlı e-posta adresinize analiz raporu 2-3 dk arasında iletilecektir.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              child: FloatingActionButton(
                backgroundColor: Colors.yellow,
                child: Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Colors.black,
                ),
                onPressed: _openFileExplorer,
              ),
              height: 100,
              width: 100),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Analiz Raporu Sadece 17.99 TL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        )
      ],
    );
  }

  void _openFileExplorer() async {
    print(_path.isEmpty.toString());
    if (_pickingType == FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        _paths = null;
        _path = await FilePicker.getFilePath(
            type: _pickingType, allowedExtensions: ['csv', 'pdf', 'doc']);
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null
                ? _paths.keys.toString()
                : '...';
      });
    }

    if (_path.isNotEmpty) {
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text("Dosya başarıyla seçildi. Verileriniz işleniyor ..."));
      Scaffold.of(context).showSnackBar(snackBar);
      AnalysisServices.createAnalysis(widget.currentUserId, _path)
          .then((value) {
        if (value.result == 1) {
          final snackBar = SnackBar(
            backgroundColor: Colors.green,
            content: Text(value.message.toString()),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(value.message.toString()),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}
