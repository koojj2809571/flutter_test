import 'package:flutter/material.dart';
import 'package:flutter_app/js_pang/demo13/draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  _DraggableState createState() => _DraggableState();
}

class _DraggableState extends State<DraggableDemo> {
  Color _draggableColor;
  Offset offset1;
  Offset offset2;

  initParams(){
    _draggableColor = Colors.grey;
    offset1 = Offset(80, 80);
    offset2 = Offset(180, 80);
  }

  @override
  void initState() {
    super.initState();
    initParams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableDemo"),
      ),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: offset1,
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: offset2,
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _draggableColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggableColor,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            initParams();
          });
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.white,
      ),
    );
  }
}
