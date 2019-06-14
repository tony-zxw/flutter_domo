import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: AssetImage//本地
          image: NetworkImage(
              'https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.indigoAccent[400].withOpacity(0.5), BlendMode.hardLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            // // padding: EdgeInsets.only(left: 24.0, right: 8.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // border: Border(//边框
              //   top: BorderSide(
              //     color: Colors.indigoAccent[100],
              //     width: 3,
              //     style: BorderStyle.solid,
              //   ),
              //   bottom: BorderSide(
              //     color: Colors.indigoAccent[100],
              //     width: 3,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              border: Border.all(
                //边框
                color: Colors.indigoAccent[100],
                width: 3,
                style: BorderStyle.solid,
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(64.0),
              //   bottomLeft: Radius.circular(64.0),
              // ), //边框每个角圆角
              // borderRadius: BorderRadius.circular(16.0), //边框圆角
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 16.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25.0, //模糊程度
                  spreadRadius: -3.0, //阴影扩散程度
                ),
              ], //阴影
              shape: BoxShape.circle, //不能使用 borderRadius圆角效果
              // gradient: RadialGradient(colors: [
              //   Color.fromRGBO(7, 102, 255, 1.0),
              //   Color.fromRGBO(3, 28, 128, 1.0),
              // ]),//进向渐变
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ), //线向渐变
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'tony_zhang',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 34.0,
            fontWeight: FontWeight.w200,
          ),
          children: [
            TextSpan(
              text: '.net',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
                // fontWeight: FontWeight.w100,
              ),
            )
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _title = '将进酒'; //qiangjinjiu
  final String _author = '李白';
  @override
  Widget build(BuildContext context) {
    return Text(
      '《 $_title 》 -- $_author 君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
