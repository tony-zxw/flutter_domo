import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItme = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentMenuItme),
                PopupMenuButton(
  //     Icon _getIcon(TargetPlatform platform) {
  //   assert(platform != null);
  //   switch (platform) {
  //     case TargetPlatform.android:
  //     case TargetPlatform.fuchsia:
  //       return const Icon(Icons.more_vert);
  //     case TargetPlatform.iOS:
  //       return const Icon(Icons.more_horiz);
  //   }
  //   return null;
  // }
                  // icon: Icon(Icons.more_horiz),
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      _currentMenuItme = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          value: 'Home',
                          child: Text('Home'),
                        ),
                        PopupMenuItem(
                          value: 'Discover',
                          child: Text('Discover'),
                        ),
                        PopupMenuItem(
                          value: 'Community',
                          child: Text('Community'),
                        ),
                      ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
