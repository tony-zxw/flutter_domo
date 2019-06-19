import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/demo/test/test_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/demo/animation/animation_demo.dart';
import 'package:flutter_demo/demo/bloc/bloc_demo.dart';
import 'package:flutter_demo/demo/http/http_demo.dart';
import 'package:flutter_demo/demo/i18n/i18n_demo.dart';
import 'package:flutter_demo/demo/rxdart/rxdart_demo.dart';
import 'package:flutter_demo/demo/state/state_management_demo.dart';
import 'package:flutter_demo/demo/stream/stream_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottomnavigationbar_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';
// import 'demo/i18n/map/demo_localizations.dart';
import 'demo/i18n/intl/intl_demo_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      // locale: Locale('en', 'US'),
      // locale: Locale('zh', 'CN'),
      // localeResolutionCallback:
      //     (Locale locale, Iterable<Locale> supportedLocales) {
      //   return Locale('en', 'US');
      // },
      localizationsDelegates: [
        DemoLocalizationsDelegate(),//自定义本地化
        //国际化
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //国际化
        Locale('en', 'US'), //默认第一个
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      // home: NavigateDemo(), //Home(),
      initialRoute: '/test', //不使用上面的，可用直接用initialRoute来规定跟路由
      // initialRoute: '/mdc', //不使用上面的，可用直接用initialRoute来规定跟路由
      routes: {
        // '/': (context) => NavigateDemo(),
        '/': (context) => Home(),
        '/about': (context) => Page(title: 'About'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo1(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18nDemo(),
        '/test': (context) => TestDemo(),
      }, //已知路由，通过名字方法pushName
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          // primarySwatch: Colors.deepPurple,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => debugPrint('Navigration button is pressed!'),
          // ),
          title: Text(
            'Flutter demo',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Serach button is pressed!'),
            ),
          ],
          elevation: 30.0, //渐变阴影
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo(),
          ],
        ),
        drawer: DrawerDemo(),
        endDrawer: Container(
          //this is left drawer
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('This is right drawer')],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
