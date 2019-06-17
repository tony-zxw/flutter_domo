import 'package:flutter/material.dart';

// class StateManagementDemo extends StatelessWidget {//静态，不能修改
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           count++;
//           print(count);
//         },
//       ),
//     );
//   }
// }

// 数据层层传递 不好，可优化

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count++;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      //解决层层嵌套
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        // body: Counter(_count, _increaseCount),
        // body: CounterWrapper(_count, _increaseCount),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount; //回调修改count数据
  // CounterWrapper(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Counter(count, increaseCount),
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// class Counter extends StatelessWidget {
//   final int count;
//   final VoidCallback increaseCount; //回调修改count数据
//   Counter(this.count, this.increaseCount);
//   @override
//   Widget build(BuildContext context) {
//     return ActionChip(
//       label: Text('$count'),
//       onPressed: increaseCount,
//     );
//   }
// }

// class Counter extends StatelessWidget {
//   final int count;
//   final VoidCallback increaseCount;//回调修改count数据
//   Counter(this.count, this.increaseCount);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       // child: Chip(
//       //   label: Text('$count'),
//       // ),
//       child: ActionChip(
//         label: Text('$count'),
//         onPressed: increaseCount,
//       ),
//     );
//   }
// }

//解决层层传值问题
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount; //回调修改count数据

//默认构造函数
  // CounterProvider({Key key, this.child}) : super(key: key, child: child);

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  final Widget child;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
