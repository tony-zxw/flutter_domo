import 'package:flutter/material.dart';
// import './map/demo_localizations.dart';
import 'intl/intl_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              // Localizations.of(context, DemoLocalizations).title,
              // DemoLocalizations.of(context).title,
              IntlDemoLocalizations.of(context).greet('tony_zhang'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
