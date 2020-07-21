import 'package:files_in_flutter/repository/repo_file.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  static const NAME_PAGE = 'Test';

  final RepoFile _repoFile = RepoFile();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child:Column(
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              )
            ).addPad(),
            Text('datos del archivo').addPad(),
            RaisedButton(
              child: Text("crear"),
              onPressed: _repoFile.createFile,
            ),
            RaisedButton(
              child: Text("escribir"),
              onPressed: () => _repoFile.writeFile(controller.text ?? "nulo"),
            ),
            RaisedButton(
              child: Text("leer"),
              onPressed: _repoFile.readFile,
            ),
            RaisedButton(
              child: Text("borrar"),
              onPressed: _repoFile.deleteFile,
            ),
            RaisedButton(
              child: Text("verificar"),
              onPressed: _repoFile.verfify,
            ),
          ],
        )
      ),
    );
  }
}

extension Pad on Widget{
  addPad(){
    return Container(
      padding: EdgeInsets.all(12),
      child: this,
    );
  }
}