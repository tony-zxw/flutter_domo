import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl_demo_messages_all.dart';
//flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/intl/intl_demo_localizations.dart 生成intl_messages.arb文件

// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=intl_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/intl_demo_localizations.dart lib/demo/i18n/intl/intl_*.arb // 不支持*号

//flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=intl_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/intl_demo_localizations.dart lib/demo/i18n/intl/intl_en.arb lib/demo/i18n/intl/intl_zh.arb lib/demo/i18n/intl/intl_messages.arb 生成前缀名的.dart文件

class IntlDemoLocalizations {
  static IntlDemoLocalizations of(BuildContext context) {
    return Localizations.of<IntlDemoLocalizations>(
        context, IntlDemoLocalizations);
  }

  static Future<IntlDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return IntlDemoLocalizations();
    });
    // return SynchronousFuture<IntlDemoLocalizations>(IntlDemoLocalizations(locale));
  }

  String get title =>
      Intl.message('hello', name: 'title', desc: 'intl demo localizations.');
  String greet(String name) => Intl.message('hello $name',
      name: 'greet', desc: 'greet someone.', args: [name]);
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<IntlDemoLocalizations> {
  DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    //判断下面load中是否支持 本地化
    // return null;
    return true;
  }

  @override
  Future<IntlDemoLocalizations> load(Locale locale) {
    // return SynchronousFuture<IntlDemoLocalizations>(IntlDemoLocalizations(locale));
    return IntlDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<IntlDemoLocalizations> old) {
    // return null;
    return false;
  }
}
