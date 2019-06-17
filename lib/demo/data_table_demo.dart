import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              // onSelectAll: (bool value){},//定制全选动作
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending, //true升序 false 降序

              columns: [
                // DataColumn(
                //   label: Container(
                //     width: 150.0,//自定义宽度
                //     child: Text('Title'),
                //   ),
                // ),
                DataColumn(
                  label: Text('Title'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      posts.sort((a, b) {
                        if (ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      posts.sort((a, b) {
                        if (ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.author.length.compareTo(b.author.length);
                      });
                    });
                  },
                ),
                DataColumn(label: Text('Image')),
              ],
              // rows: [
              //   DataRow(cells: [
              //     DataCell(Text('hello ~')),
              //     DataCell(Text('tony_zhang'))
              //   ]),
              //   DataRow(cells: [
              //     DataCell(Text('hola ~')),
              //     DataCell(Text('tony_zhang'))
              //   ]),
              //   DataRow(cells: [
              //     DataCell(Text('你好 ~')),
              //     DataCell(Text('tony_zhang'))
              //   ]),
              // ],
              rows: posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
