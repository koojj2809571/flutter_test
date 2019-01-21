import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo08/expansion_panel_list_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ExpansionTileDemo",
      theme: ThemeData.dark(),
      //home: ExpansionTileDemo(),
      home: ExpansionPanelListDemo(),
    );
  }
}

class ExpansionTileDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion Tile Demo"),),
      body: Center(
        child: ExpansionTile(
          title: Text("Expansion Tile"),
          backgroundColor: Colors.white12,
          leading: Icon(Icons.ac_unit),
          children: <Widget>[
            ListTile(
              title: Text("list tile title"),
              subtitle: Text("list tile subtitle"),
            ),
          ],
          initiallyExpanded: false,
        ),
      ),
    );
  }
}