import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'demo/listview_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottomnavigationbar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        // primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => debugPrint('Navigration button is pressed!'),
          // ),
          title: Text(
            'Flutter demo',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Serach button is pressed!'),
            ),
          ],
          elevation: 30.0, //渐变阴影
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Tab(
            //   icon: Icon(
            //     Icons.local_florist,
            //     size: 128.0,
            //     color: Colors.black12,
            //   ),
            // ),
            ListViewDemo(),
            Tab(
                icon: Icon(
              Icons.change_history,
              size: 128.0,
              color: Colors.black12,
            )),
            Tab(
                icon: Icon(
              Icons.directions_bike,
              size: 128.0,
              color: Colors.black12,
            )),
          ],
        ),
        drawer: DrawerDemo(),
        endDrawer: Container(
          //this is left drawer
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('This is right drawer')],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
