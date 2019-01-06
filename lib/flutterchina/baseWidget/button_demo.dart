import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new ButtonDemo());

class ButtonDemo extends StatelessWidget {
  final String title = "按钮Demo";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: () {},
              colorBrightness: Brightness.dark,
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: (){},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: (){},
            ),

            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: () => {},
            ),

            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
