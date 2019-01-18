import 'package:flutter/material.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget{
  final title = "输入框和表单";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: new EditTextDemo(title: title,),
    );
  }
}

class EditTextDemo extends StatefulWidget{
  EditTextDemo({Key key,this.title}):super(key:key);
  final String title;
  @override
  State<StatefulWidget> createState() => new EditorTextState(title: title);
}

class EditorTextState extends State<EditTextDemo>{
  EditorTextState({this.title});
  final String title;
  TextEditingController _myController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _myController.addListener((){
      print(_myController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)
            ),
            onChanged: (v){
              print("onChanged: $v");
            },
            controller: _myController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}