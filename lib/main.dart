import 'package:flutter/material.dart';
import 'package:navbar/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new MyHomePage(title: 'Scrollable Bottom Nav Bar'),
    );
  }
}
