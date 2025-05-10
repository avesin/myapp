import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/home_background.dart';

void main() {
  testWidgets('HomeBackground renders child and app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeBackground(
        title: 'Test Title',
        child: Text('Child Widget'),
      ),
    ));

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Child Widget'), findsOneWidget);
  });
}
