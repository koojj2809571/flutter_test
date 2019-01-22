import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo13/draggable_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Draggable Demo",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DraggableDemo(),
    );
  }
}