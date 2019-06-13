import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model/post.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.black26,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Image.network(posts[index].imageUrl),
        SizedBox(
          height: 16.0,
        ),
        Text(posts[index].title, style: Theme.of(context).textTheme.title),
        Text(posts[index].author, style: Theme.of(context).textTheme.subhead),
        SizedBox(
          height: 16.0,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'Flutter demo',
          ),
          elevation: 30.0, //渐变阴影
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
        ));
  }
}
