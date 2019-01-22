import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToolTipDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ToolTipDemo(),
    );
  }
}

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TooltipDemo"),
      ),
      body: Center(
        child: Tooltip(
          message: "~~~~~~~~~~~~~~~~~~~~~~~",
          child: Image.network(
              "http://pic1.win4000.com/wallpaper/2018-02-01/5a72d6ee6b46f.jpg"),
        ),
      ),
    );
  }
}
