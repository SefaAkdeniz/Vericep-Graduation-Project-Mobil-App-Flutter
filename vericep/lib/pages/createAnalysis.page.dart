import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAnalysisPage extends StatefulWidget {
  @override
  _CreateAnalysisPageState createState() => _CreateAnalysisPageState();
}

class _CreateAnalysisPageState extends State<CreateAnalysisPage> {
  String _fileName;
  String _path;
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
        Center(
            child: FloatingActionButton(
          onPressed: _openFileExplorer,
        ))
      ],
    );
  }

  void _openFileExplorer() async {
    if (_pickingType == FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        _paths = null;
        _path = await FilePicker.getFilePath(
            type: _pickingType, allowedExtensions: ['jpg', 'pdf', 'doc']);
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
  }
}
