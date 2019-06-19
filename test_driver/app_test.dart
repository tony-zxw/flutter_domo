import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:test_api/test_api.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');
    final actionChipLabelText = find.byValueKey('actionChipLabelText');
    // expect(actionChip, findsOneWidget);
    // expect(actionChipText, findsOneWidget);

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(actionChipLabelText), '0');
    });

    test('increments the counter', () async {
      await driver.tap(actionChip);
      expect(await driver.getText(actionChipLabelText), '1');
    });
  });
}
