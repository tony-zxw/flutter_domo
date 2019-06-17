import 'package:flutter/material.dart';

enum Option { A, B, C }

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    //返回或者向下划来关闭
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                height: 16.0,
              ),
              Text('01:30/03:30'),
              Expanded(
                child: Text(
                  'Fix you - Coldpay',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  String _choice = 'Nothing';

  _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Option A'),
                onTap: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () {
                  Navigator.pop(context, Option.C);
                },
              )
            ],
          ),
        );
      },
    );

    String res = 'Nothing';
    switch (option) {
      case Option.A:
        res = 'A';
        break;
      case Option.A:
        res = 'B';
        break;
      case Option.A:
        res = 'C';
        break;
      default:
        res = 'Nothing';
    }
    setState(() {
      _choice = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Open BottomSheet'),
                  onPressed: _openBottomSheet,
                ),
                FlatButton(
                  child: Text('Modal BottomSheet'),
                  onPressed: _openModalBottomSheet,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('Modal BottomSheet choice is $_choice'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
