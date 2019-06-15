import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    // shape: BeveledRectangleBorder(
    //   //正方形
    //   borderRadius: BorderRadius.circular(30.0), //角
    // ),
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    //构造一个floatingactionbutton
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('add'),
    // elevation: 0.0,
    // backgroundColor: Colors.black87,
    // shape: BeveledRectangleBorder(
    //   //正方形
    //   // borderRadius: BorderRadius.circular(30.0), //角
    // ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
          color: Colors.grey,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
