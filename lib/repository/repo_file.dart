import 'dart:io';

import 'package:path_provider/path_provider.dart';

class RepoFile{
  
  Future<String> getPath() async {
    // print("============= GET PATH ==================");
    // List<Directory> directories = await getExternalCacheDirectories();
    Directory directories = await getTemporaryDirectory();
    // directories.forEach((element) => print(element));
    print(directories.path);
    return directories.path;
  }
  
  Future createFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    print("============= CREATE FILE ==================");
    print(await file.exists());
    print(await file.exists());
  }

  Future deleteFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    await file.delete();
    print(file.existsSync());
  }

  Future readFile() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    try {
      String data = await file.readAsString();
      print(data);
    } catch (e) {
      print(e);
    }
  }

  Future writeFile(String data) async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    File tempFile = await file.writeAsString("$data\n", mode: FileMode.append, flush: true);
    print(path);
    print(tempFile.path);
    print(
      File(tempFile.path).existsSync()
    );
  }

  Future verfify() async {
    final path = await getPath();
    File file = File("/$path/notas.txt");
    print(file.existsSync());
  }
}