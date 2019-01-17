import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo3/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pages Router",
      theme: ThemeData.light(),
      home: FirstPage(),
    );
  }
}