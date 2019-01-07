import 'package:flutter/material.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget {
  final String title = "单选开关和复选框";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SwitchAndCheckBoxTestRoute(title: title,),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  SwitchAndCheckBoxTestRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new SwitchAndCheckBoxTestState(title: title);
}

class SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTestRoute> {
  SwitchAndCheckBoxTestState({this.title});

  final String title;
  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkBoxSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkBoxSelected = value;
              });
            },
          )
        ],
      ),
    );
  }
}
