import 'package:flutter/material.dart';

class ScreenWidget extends StatefulWidget{
  final String title;
  ScreenWidget(this.title);

  @override
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<ScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
