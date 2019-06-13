import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Tony_zhang',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'zhangxiaowei098@163.com',
            ),
            currentAccountPicture: CircleAvatar(
              // backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/crop.0.0.180.180.180/441f4fd7jw1e8qgp5bmzyj2050050aa8.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[300],
              image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.yellow[300].withOpacity(0.6),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            // leading: Icon(Icons.done, color: Colors.black12, size: 22.0),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context), //点击关闭
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            // leading: Icon(Icons.done, color: Colors.black12, size: 22.0),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            // leading: Icon(Icons.done, color: Colors.black12, size: 22.0),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
