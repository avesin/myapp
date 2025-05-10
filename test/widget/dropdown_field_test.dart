import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/dropdown_field.dart';

void main() {
  testWidgets('DropdownField shows label and value, can change value', (tester) async {
    String? selectedValue = 'Option 1';

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              body: DropdownField(
                label: 'Choose:',
                value: selectedValue,
                items: ['Option 1', 'Option 2'],
                onChanged: (val) {
                  setState(() {
                    selectedValue = val!;
                  });
                },
              ),
            );
          },
        ),
      ),
    );

    expect(find.text('Choose:'), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);

    // Tap dropdown button
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();

    // Pilih Option 2
    await tester.tap(find.text('Option 2').last);
    await tester.pumpAndSettle();

    // Verifikasi UI sekarang menampilkan Option 2
    expect(find.text('Option 2'), findsOneWidget);
  });
}
