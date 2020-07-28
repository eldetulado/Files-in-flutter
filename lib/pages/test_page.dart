import 'package:files_in_flutter/repository/repo_file.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  static const NAME_PAGE = 'Test';

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with WidgetsBindingObserver {
  final RepoFile _repoFile = RepoFile();
  final TextEditingController controller = TextEditingController();
  final shapeButton = StadiumBorder();

  String dataFile;

  @override
  void initState() {
    print("========= INIT STATE ===========");
    _repoFile.writeFile("${DateTime.now().toString()} init State \n");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("========= DISPOSE ===========");
    _repoFile.writeFile("${DateTime.now().toString()} dispose State \n");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print("========= PAUSED ===========");
      _repoFile.writeFile("${DateTime.now().toString()} paused State \n");
    }
    if (state == AppLifecycleState.resumed) {
      print("========= RESUME ===========");
      _repoFile.writeFile("${DateTime.now().toString()} resume State \n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Files in flutter"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ).addPad(),
          Text(dataFile ?? 'datos del archivo').addPad(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  shape: shapeButton,
                  child: Text("Escribir"),
                  onPressed: () async {
                    await _repoFile.writeFile(controller.text.trim() ?? "nulo");
                    this.controller.clear();
                  }).addExpanded(),
              RaisedButton(
                shape: shapeButton,
                child: Text("Leer"),
                onPressed: () async {
                  this.dataFile = await _repoFile.readFile();
                  setState(() {});
                },
              ).addExpanded(),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                shape: shapeButton,
                child: Text("Crear file"),
                onPressed: _repoFile.createFile,
              ).addExpanded(),
              RaisedButton(
                shape: shapeButton,
                child: Text("Borrar"),
                onPressed: _repoFile.deleteFile,
              ).addExpanded(),
            ],
          ),
          RaisedButton(
            child: Text("Verificar"),
            onPressed: _repoFile.verfify,
          ),
        ],
      ),
    );
  }
}

extension Pad on Widget {
  addPad({double value = 12}) {
    return Container(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  addExpanded() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: this,
      ),
    );
  }
}
