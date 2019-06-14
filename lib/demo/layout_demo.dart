import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Row Column
        mainAxisAlignment: MainAxisAlignment
            .center, //默认start spaceAround spaceBetween spaceEvenly
        // crossAxisAlignment: CrossAxisAlignment.start, //交叉轴，默认center stretch start end

        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200.0,
              maxWidth: 200.0,
            ),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Row Column
        mainAxisAlignment: MainAxisAlignment
            .center, //默认start spaceAround spaceBetween spaceEvenly
        // crossAxisAlignment: CrossAxisAlignment.start, //交叉轴，默认center stretch start end

        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0, //宽高比
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Row Column
        mainAxisAlignment: MainAxisAlignment
            .center, //默认start spaceAround spaceBetween spaceEvenly
        // crossAxisAlignment: CrossAxisAlignment.start, //交叉轴，默认center stretch start end

        children: <Widget>[
          Stack(
            //叠加
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                width: 200.0,
                height: 300.0,
                child: Container(
                  alignment: Alignment(1.0,
                      -1.0), //Alignment.topCenter,//Alignment(0.8, -0.8),//中间0.0,0.0
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // child: Icon(
                  //   Icons.ac_unit,
                  //   color: Colors.white,
                  //   size: 32.0,
                  // ),
                ),
              ),
              SizedBox(
                height: 32.0, //间隔
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 24, 125, 1.0),
                    // borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0),
                    ]),
                  ),
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.white,
                    size: 32.0,
                  ),
                ),
              ),
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Positioned(
                right: 20.0,
                top: 120.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              Positioned(
                right: 70.0,
                top: 180.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
              Positioned(
                right: 90.0,
                top: 20.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              Positioned(
                right: 4.0,
                top: -4.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconBadgeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Row Column
        mainAxisAlignment: MainAxisAlignment
            .center, //默认start spaceAround spaceBetween spaceEvenly
        // crossAxisAlignment: CrossAxisAlignment.start, //交叉轴，默认center stretch start end

        children: <Widget>[
          IconBadge(
            Icons.pool,
          ),
          IconBadge(
            Icons.beach_access,
            size: 64.0,
          ),
          IconBadge(
            Icons.airplanemode_active,
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon, {this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
