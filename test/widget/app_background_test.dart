import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/app_background.dart';

void main() {
  testWidgets('AppBackground shows title and child', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AppBackground(
        title: 'Test Title',
        child: const Text('Child Content'),
      ),
    ));

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Child Content'), findsOneWidget);
  });
}
