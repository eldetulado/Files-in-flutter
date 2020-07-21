import 'dart:io';

import 'package:path_provider/path_provider.dart';

class RepoFile {
  Future<String> getPath() async {
    Directory directories = await getTemporaryDirectory();
    print(directories.path);
    return directories.path;
  }

  Future createFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    print(file);
  }

  Future deleteFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    await file.delete();
  }

  Future<String> readFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    try {
      String data = await file.readAsString();
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future writeFile(String data) async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    if (data.isNotEmpty) {
      File tempFile = await file.writeAsString(
        "$data\n",
        mode: FileMode.append,
        flush: true,
      );
    }
  }

  Future verfify() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    print(file.existsSync());
  }
}
