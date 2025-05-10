import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/editable_field.dart';

void main() {
  testWidgets('EditableField shows label and hint', (tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: EditableField(
          label: 'Nama',
          hint: 'Masukkan nama',
          controller: controller,
        ),
      ),
    ));

    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Masukkan nama'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Aditya');
    expect(controller.text, 'Aditya');
  });
}
