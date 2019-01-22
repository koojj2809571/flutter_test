import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo11/right_back_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RightBackDemo",
      theme: ThemeData.dark(),
      home: RightBackDemo(),
    );
  }
}