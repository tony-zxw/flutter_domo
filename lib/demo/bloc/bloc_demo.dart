import 'package:flutter/material.dart';
import 'counter_bloc_demo.dart';

// BLoC google 提供的反应式（响应式）开发架构 业务逻辑组件，会使用到Stream 或rxdart的Observable
class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      //InheritedWidget
      bloc: CounterBloc(), //下面的都可用用CounterBloc
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
