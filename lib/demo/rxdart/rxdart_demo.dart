import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

//Reactive extensions 响应式编程 observable 如 rxjs rxdart
class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();
    // Observable<String> _observable =
    //     // Observable(Stream.fromIterable(['hello', '你好']));
    //     // Observable.fromFuture(Future.value('hello~'));
    //     // Observable.fromIterable(['hello', '你好']);
    //     // Observable.just('hello');
    //     Observable.periodic(Duration(seconds: 3), (x) => x.toString());//重复执行

    // // _observable.listen(onData);
    // _observable.listen(print); //输出到控制台上
    // _observable.close();
//-------------------------
    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.listen((data) => print('listen 1:$data'));

    // _subject.add('hello');//注意与listen的顺序，否则无法监听

    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}'));

    // _subject.add('hola');

    // _subject.close();
//-------------------------
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();//与顺序没有太大关系，只是监听最后一个
    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.listben((data) => print('listen 1:$data'));
    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}'));

    // _subject.close();
//-------------------------
    // ReplaySubject<String> _subject =
    //     ReplaySubject<String>(maxSize: 2); //与顺序无关，监听所有或限制最大个数
    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('嘻嘻嘻');
    // _subject.listen((data) => print('listen 1:$data'));
    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}'));

    // _subject.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
        // .map((item) => 'Item: $item') //处理数据
        // .where((item) => item.length > 9) //条件
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))//??
        // .debounceTime(Duration(microseconds: 5000))//500毫米后启用监听
        .listen((data) => print(data));
  }

  @override
  void dispose() {
    _textFieldSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input:$value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit:$value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
