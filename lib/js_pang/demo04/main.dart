import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo04/frosted_glass_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "frosted_glass_demo",
      theme: ThemeData.dark(),
      home: Scaffold(
        body: FrostedGlassDemo(),
      ),
    );
  }
}