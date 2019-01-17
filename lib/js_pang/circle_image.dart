
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final String title = "圆形图片示例";
    final String url = "http://img5.mtime.cn/mg/2018/12/04/160519.43555325_170X256X4.jpg";
    Widget stack = new Stack(

      children: <Widget>[
        CircleAvatar(radius: 200, backgroundImage: NetworkImage(url,scale: 1.0),),
        new Positioned(top:200.0, left: 200.0,child: Text("1234567",style: TextStyle(color: Colors.white),)),
      ],
    );
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title,style: TextStyle(color: Colors.grey),),
        ),
        body: Center(
          child: stack,
        ),
      ),
    );
  }
}