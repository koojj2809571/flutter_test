import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new ImageIconDemo());

class ImageIconDemo extends StatelessWidget {
  final String title = "图片及Icon";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(
        title: title,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(title),
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                "images/avatar.png",
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                ),
            ),Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text("\uE914\uE000\uE90D",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 24.0,
                      color: Colors.green
                  ),
                ),
            ),
          ],
        ),

      ),
    );
  }
}
