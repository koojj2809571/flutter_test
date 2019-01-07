import 'package:flutter/material.dart';

void main() => runApp(new BaseWidgetCatalogue());

class BaseWidgetCatalogue extends StatelessWidget{
  final String title = "基本组件目录";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.black45),
      home: new CatalogueHomePage(title: title,),
    );
  }

}

class CatalogueHomePage extends StatelessWidget{
  CatalogueHomePage({Key key, this.title}):super(key:key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text(title),
        ),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: new Row(

            ),
          ),
        ],
      ),
    );
  }

}