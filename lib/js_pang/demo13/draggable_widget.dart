import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

  DraggableWidget({Key key, this.offset, this.widgetColor}) : super(key: key);

  _DraggableState createState() => _DraggableState();
}

class _DraggableState extends State<DraggableWidget> {
  Offset offset = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 80,
          height: 80,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity v, Offset o) {
          setState(() {
            this.offset = o;
          });
        },
      ),
    );
  }
}
