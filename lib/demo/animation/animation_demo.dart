import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

//默认动画匀速的（线性）
class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;

  CurvedAnimation curve; //使动画非匀速（非线性）
  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      // value: 32.0,
      // lowerBound: 16.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this, //TickerProviderStateMixin
    );

    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);//线性

    // animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
    //     .animate(animationDemoController);//线性

    animation = Tween(begin: 32.0, end: 100.0).animate(curve); //非线性

    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(curve); //非线性

    // animationDemoController.addListener(() {
    //   // print('${animationDemoController.value}');
    //   setState(() {});
    // });

    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // animationDemoController.forward();
  }

  @override
  void dispose() {
    animationDemoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ActionChip(
      //   label: Text('${animationDemoController.value}'),
      //   onPressed: () {
      //     animationDemoController.forward();
      //   },
      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);
  final List animations;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      // iconSize: animationDemoController.value,
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse(); //倒退
            break;
          default:
            controller.forward(); //前进
        }
      },
    );
  }
}
