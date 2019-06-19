// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/test/test_demo.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:flutter_demo/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   // await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
  //-----------
  //test class
  //Unit testing

  test('shuold return hello +something.', () {
    var string = TonyTestDemo.greet('tony_zhang');
    expect(string, 'hello tony_zhang');
  });

  //widgets testing
  testWidgets('widget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));
    final lableText = find.text('hello');
    // expect(lableText, findsNothing);//没有找到
    // expect(lableText, findsOneWidget);
    expect(lableText, findsNWidgets(1));

    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    expect(actionChip, findsOneWidget);
    await tester.tap(actionChip); //点击widget
    await tester.pump(); //重建widget

    final actionChipLabelTextAfterTap = find.text('1');
    expect(actionChipLabelTextAfterTap, findsOneWidget);
    expect(actionChipLabelText, findsNothing);
  });

  //Integration testing 需要flutter_driver包

}
