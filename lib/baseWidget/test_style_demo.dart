import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new TextStyleWidget());

class TextStyleWidget extends StatelessWidget {
  final String _title = "文本及样式";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(
        title: _title,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DefaultTextStyle(
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color = Colors.teal,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "你好世界！",
                textAlign: TextAlign.center,
              ),
              Text(
                "你好世界！这是一个Text测试程序~" * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "你好世界！",
                textScaleFactor: 1.5,
              ),
              Text(
                "你好世界！",
                style: TextStyle(
                    inherit: false,
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy),
              ),
            ],
          ),
        ));
  }
}
