import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamHomeDemo(),
    );
  }
}

class StreamHomeDemo extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamHomeDemo> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo; //控制stream

  StreamSink _sinkDemo;
  @override
  void dispose() {
    _streamDemo.close(); //释放
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('create a stream.');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());//使用streamController
    _streamDemo = StreamController<String>();

    _sinkDemo=_streamDemo.sink;//水池 水槽的意思
    print('start listening on a stream.');
    // _streamSubscription =
    //     _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    print('initialize completed.');
  }

  void onError(error) {
    print('error: $error.');
  }

  void onDone() {
    print('Done.');
  }

  void onData(String data) {
    print('$data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5)); //延时3s
    // throw 'Something happend.';
    return 'hello~';
  }

  void _pauseStraem() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStraem() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStraem() {
    print('Cancel subscription');
    _streamSubscription.cancel();
  }

  void _addDataToStraem() async {
    print('Add Data To Straem');
    String data = await fetchData();
    // _streamDemo.add(data);

    _sinkDemo.add(data);//用sink来
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: _addDataToStraem,
            ),
            FlatButton(
              child: Text('Pause'),
              onPressed: _pauseStraem,
            ),
            FlatButton(
              child: Text('Resume'),
              onPressed: _resumeStraem,
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: _cancelStraem,
            ),
          ],
        ),
      ),
    );
  }
}
