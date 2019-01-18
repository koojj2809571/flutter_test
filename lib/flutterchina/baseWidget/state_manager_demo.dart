import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          "super_widget_manage": (context) => new ParentWidget(),
          "mix_manage": (context) => new ParentWidgetC(),
          "simple_cupertino": (context) => new CupertinoTestRoute(),
        },
        home: HomePage(title: title));
  }
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("IOS风格Demo"),
        ),
        child: Center(
          child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {},
          ),
        ));
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  final String cupertinoDemo = "simple_cupertino";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
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
            FlatButton(
              child: Text("IOS风格Demo"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, cupertinoDemo);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new TapBoxAState();
}

class TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text(_active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
        ),
      ),
    );
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ParentWidget extends StatefulWidget {
  ParentWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapBoxB(
      active: _active,
      onChanged: _handleTapBoxChanged,
    ));
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Center(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ParentWidgetC extends StatefulWidget {
  ParentWidgetC({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChanged,
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() => new _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handTap,
      child: new Center(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
          width: 400.0,
          height: 400.0,
          decoration: new BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[700],
              border: _highlight
                  ? new Border.all(color: Colors.teal[700], width: 100.0)
                  : null),
        ),
      ),
    );
  }
}
