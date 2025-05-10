import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/info_item.dart';

void main() {
  testWidgets('InfoItem shows label and value', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: InfoItem(label: 'Nama:', value: 'Aditya'),
  ));

  final richText = find.byType(RichText);
  expect(richText, findsOneWidget);

  // Cek seluruh teks yang digabung
  final richTextWidget = tester.widget<RichText>(richText);
  final span = richTextWidget.text as TextSpan;
  final fullText = span.toPlainText();

  expect(fullText, contains('Nama:'));
  expect(fullText, contains('Aditya'));
});
}