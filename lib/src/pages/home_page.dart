import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:upload_files/src/providers/api_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void _openFileExplorer() async {
    try {
      File file = await FilePicker.getFile(type: FileType.any);

      if (file == null) {
        print('no tiene archivo adjunto');
      } else {
        await ApiProvider.upload(file);
        print('file $file');
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload file"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: RaisedButton(
                onPressed: () => _openFileExplorer(),
                child: Text("Open file picker"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
