import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/info_card.dart';

void main() {
  testWidgets('InfoCard displays title and content', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: InfoCard(
        title: 'Info Title',
        content: 'This is the content.',
        onEdit: () {},
      ),
    ));

    expect(find.text('Info Title'), findsOneWidget);
    expect(find.text('This is the content.'), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
  });
}
