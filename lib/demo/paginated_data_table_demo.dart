import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false; //不确定用true

  @override
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => _selectedCount;

/**
 * _sort 使用匿名函数
 */
  void _sort(getFiled(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getFiled(a);
      final bValue = getFiled(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  final PostDataSource _postsDataSource = PostDataSource();
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Post'),
              rowsPerPage: 5,
              source: _postsDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending, //true升序 false 降序

              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnindex, bool ascending) {
                    _postsDataSource._sort((post) => post.title.length,
                        ascending); // (post) => post.title.length 是匿名函数，入参是post 返回是post.title.length！
                    setState(() {
                      _sortColumnIndex = columnindex;
                      _sortAscending = ascending;
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                  // onSort: (int columnindex, bool ascending) {
                  //   setState(() {
                  //     _sortColumnIndex = columnindex;
                  //     _sortAscending = ascending;
                  //     posts.sort((a, b) {
                  //       if (ascending) {
                  //         final c = a;
                  //         a = b;
                  //         b = c;
                  //       }
                  //       return a.author.length.compareTo(b.author.length);
                  //     });
                  //   });
                  // },
                ),
                DataColumn(label: Text('Image')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
