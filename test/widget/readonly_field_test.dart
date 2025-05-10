import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/readonly_field.dart';

void main() {
  testWidgets('ReadonlyField shows label and value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ReadonlyField(label: 'Email', value: 'test@example.com'),
    ));

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);
  });
}
