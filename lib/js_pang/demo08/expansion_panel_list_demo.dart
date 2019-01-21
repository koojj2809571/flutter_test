import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<ExpansionPanelListDemo> {
  List<int> mIndexList;
  List<ExpansionPanelBean> mPanelBeanList;

  _ExpansionState() {
    mIndexList = new List();
    mPanelBeanList = new List();

    for (int i = 0; i < 20; i++) {
      mIndexList.add(i);
      mPanelBeanList.add(new ExpansionPanelBean(i, false));
    }
  }

  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      mPanelBeanList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansin Panel List"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mIndexList.map(
            (index) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text("This is No.$index"),
                  );
                },
                body: ListTile(
                  title: Text("expansion no.$index"),
                ),
                isExpanded: mPanelBeanList[index].isOpen,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class ExpansionPanelBean {
  var index;
  var isOpen;

  ExpansionPanelBean(this.index, this.isOpen);
}
