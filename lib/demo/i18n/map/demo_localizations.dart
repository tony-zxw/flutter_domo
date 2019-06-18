import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);
  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    //判断下面load中是否支持 本地化
    // return null;
    return true;
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // return null;
    return false;
  }
}
