import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ClipPathDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("贝赛尔曲线Demo"),elevation: 10.0,),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlP = Offset(size.width * 0.25, size.height);
    var firstEndP = Offset(size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(firstControlP.dx, firstControlP.dy, firstEndP.dx, firstEndP.dy);
    path.lineTo(firstEndP.dx, firstEndP.dy);
    var secondControlP = Offset(size.width * 0.75, size.height - 100);
    var secondEndP = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlP.dx, secondControlP.dy, secondEndP.dx, secondEndP.dy);
    path.lineTo(secondEndP.dx, secondEndP.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}