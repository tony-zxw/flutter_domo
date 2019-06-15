import 'package:flutter/material.dart';

class NavigateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('About'),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => Page(title: 'About'),
                // ));
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  Page({this.title}); //类似与构造函数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        //一个新的返回按钮
        child: Icon(Icons.arrow_back),
        onPressed: () {
          debugPrint('back');
          Navigator.pop(context);
        },
      ),
    );
  }
}
