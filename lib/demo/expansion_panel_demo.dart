import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  // bool _isExpanded = false;
  // List<bool> _isExpandeds = [false, false, false, false, false, false];

  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text(
            'Content for Panel A.',
            style: TextStyle(color: Colors.pink),
          ),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel D',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel D.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel E',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel E.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel F',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel F.'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          // Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                // print(panelIndex);
                // print(isExpanded);
                setState(() {
                  // for (int i = 0; i < _isExpandeds.length; i++) {
                  //   _isExpandeds[i] = false;
                  // }
                  // _isExpandeds[panelIndex] = !isExpanded;
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  body: item.body,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        item.headerText,
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                );
              }).toList(),
              // children: [
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel A',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel A.'),
              //     ),
              //     isExpanded: _isExpandeds[0],
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel B',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel B.'),
              //     ),
              //     isExpanded: _isExpandeds[1],
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel C',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel C.'),
              //     ),
              //     isExpanded: _isExpandeds[2],
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel D',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel D.'),
              //     ),
              //     isExpanded: _isExpandeds[3],
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel E',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel E.'),
              //     ),
              //     isExpanded: _isExpandeds[4],
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel F',
              //             style: Theme.of(context).textTheme.title),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel F.'),
              //     ),
              //     isExpanded: _isExpandeds[5],
              //   ),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
