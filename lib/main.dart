import 'package:flutter/material.dart';

import 'pages/test_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo working with files',
      theme: ThemeData.dark(),
      home: TestPage(),
    );
  }
}
