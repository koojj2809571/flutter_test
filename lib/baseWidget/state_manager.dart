import 'package:flutter/material.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget {
  final String title = "状态管理";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          "self_manage": (context) => new TapBoxA(),
          "super_widget_manage": (context) => new TapBoxB(),
          "mix_manage": (context) => new TapBoxC(),
        },
        home: HomePage(title: title));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final String selfManage = "self_manage";
  final String superManage = "super_widget_manage";
  final String mixManage = "mix_manage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Widget管理自身状态"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, selfManage);
              },
            ),
            FlatButton(
              child: Text("父Widget管理状态"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, superManage);
              },
            ),
            FlatButton(
              child: Text("混合管理状态"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, mixManage);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() => new TapBoxAState();
}

class TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 10.0,
        height: 10.0,
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white)
          ),
        ),
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

class TapBoxB extends StatefulWidget {
  TapBoxB({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() => new TapBoxBState();
}

class TapBoxBState extends State<TapBoxB> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() => new TapBoxCState();
}

class TapBoxCState extends State<TapBoxC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
