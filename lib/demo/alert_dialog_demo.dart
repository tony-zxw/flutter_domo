import 'package:flutter/material.dart';

enum Action { Ok, Cancel }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';
  Future _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false, //必须选择对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, Action.Ok);
              },
            ),
          ],
        );
      },
    );
    String res = 'Nothing';
    switch (action) {
      case Action.Ok:
        res = 'OK';
        break;
      case Action.Cancel:
        res = 'Cancel';
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
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You choice is: $_choice'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text('Your choic is $_choice'),
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.format_list_numbered),
      //   onPressed: _openAlertDialog,
      // ),
    );
  }
}
