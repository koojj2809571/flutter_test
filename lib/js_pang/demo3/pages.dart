import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo3/costum_route.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("First Page",style: TextStyle(fontSize: 36.0),),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).push(CustomRoute(SecondPage()));
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text('SecondPage',style:TextStyle(fontSize:36.0),),
          backgroundColor: Colors.pinkAccent,
          leading:Container(),
          elevation: 10.0,
        ),
        body:Center(
          child: MaterialButton(
            child: Icon(
                Icons.navigate_before,
                color:Colors.white,
                size:64.0
            ),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
        )
    );
  }
}