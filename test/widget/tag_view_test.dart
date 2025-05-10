import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/tag_view.dart';

void main() {
  testWidgets('TagView shows label and optional icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TagView(label: 'Flutter', icon: '🔥'),
    ));

    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('🔥'), findsOneWidget);
  });

  testWidgets('TagView works without icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TagView(label: 'Dart'),
    ));

    expect(find.text('Dart'), findsOneWidget);
  });
}
