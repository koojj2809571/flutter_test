import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo1/screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationWidget> {
  final _bottomNavigationBarColor = Colors.blue;
  final _bottomNavigationBarColorS = Colors.white;

  List<String> list = List();
  int _currentIndex = 0;

  @override
  void initState() {
    list..add("Home")..add("Email")..add("Pages")..add("AirPlay");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "底部导航栏",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              Text(
                list[_currentIndex],
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              ),
            ],
          ),
        ),
      ),
      body: ScreenWidget(list[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? _bottomNavigationBarColor : _bottomNavigationBarColorS,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: _currentIndex == 0 ? _bottomNavigationBarColor : _bottomNavigationBarColorS),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _currentIndex == 1 ? _bottomNavigationBarColor : _bottomNavigationBarColorS,
            ),
            title: Text(
              "Email",
              style: TextStyle(color: _currentIndex == 1 ? _bottomNavigationBarColor : _bottomNavigationBarColorS),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _currentIndex == 2 ? _bottomNavigationBarColor : _bottomNavigationBarColorS,
            ),
            title: Text(
              "Pages",
              style: TextStyle(color: _currentIndex == 2 ? _bottomNavigationBarColor : _bottomNavigationBarColorS),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _currentIndex == 3 ? _bottomNavigationBarColor : _bottomNavigationBarColorS,
            ),
            title: Text(
              "AirPlay",
              style: TextStyle(color: _currentIndex == 3 ? _bottomNavigationBarColor : _bottomNavigationBarColorS),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
