import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo05/keep_alive_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "keep_alive_demo",
      theme: ThemeData.dark(),
      home: KeepAliveDemo(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keep Alive Demo"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
    );
  }
}
