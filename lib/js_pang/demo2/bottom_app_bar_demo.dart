import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo2/each_view.dart';

class BottomAppBarWidget extends StatefulWidget {
  @override
  BottomAppBarState createState() => BottomAppBarState();
}

class BottomAppBarState extends State<BottomAppBarWidget> {

  List<Widget> _eachView;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView..add(EachView("Home"))..add(EachView("Vehicle"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EachView("New Page");
          }));
        },
        tooltip: "Add",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
