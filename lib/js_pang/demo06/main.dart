import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo06/search_bar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Search Bar Demo",
      theme: ThemeData.light(),
      home: SearchBarDemo(),
    );
  }
}