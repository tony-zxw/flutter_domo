import 'package:intl/intl.dart';
//flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/intl/intl_demo_localizations.dart 生成intl_messages.arb文件

//flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=intl_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/intl_demo_localizations.dart lib/demo/i18n/intl/x_intl_*.arb 生成前缀名的.arb文件

class IntlDemoLocalizations {
  String get title =>
      Intl.message('hello', name: 'title', desc: 'intl demo localizations.');
  String greet(String name) => Intl.message('hello $name',
      name: 'greet', desc: 'greet someone.', args: [name]);
}
