import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/app_bar.dart';

void main() {
  testWidgets('MyAppBar shows title and buttons when provided', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(
          title: 'Header',
          isMoreButton: true,
          isSaveButton: true,
          onTapMore: () {},
          onTapSave: () {},
        ),
      ),
    ));

    expect(find.text('Header'), findsOneWidget);
    expect(find.byIcon(Icons.more_horiz), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
  });
}
