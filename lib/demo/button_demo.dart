import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flateButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('FlatButton'),
          // onPressed: null,//null 禁用
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButtonIcon'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0)
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('RaisedButton'),
            // onPressed: null,//null 禁用
            onPressed: () {},
            splashColor: Colors.grey,
            elevation: 0.0,
            // textColor: Theme.of(context).accentColor,
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('RaisedButtonIcon'),
          onPressed: () {},
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0)
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('OutlineButtonIcon'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 230.0,
          child: OutlineButton(
            child: Text('FixedOutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightColor: Colors.grey,
          ),
        ),
      ],
    );

    final Widget expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('ExpandedOutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightColor: Colors.grey,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          flex: 2, //默认1
          child: OutlineButton(
            child: Text('ExpandedOutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightColor: Colors.grey,
          ),
        ),
      ],
    );

    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
          )),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flateButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButtonDemo,
            expandedButtonDemo,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
