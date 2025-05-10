import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widget/gradient_button.dart';

void main() {
  testWidgets('GradientButton shows text and triggers onPressed', (tester) async {
    bool pressed = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GradientButton(
          text: 'Submit',
          onPressed: () {
            pressed = true;
          },
        ),
      ),
    ));

    expect(find.text('Submit'), findsOneWidget);

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(pressed, true);
  });

  testWidgets('GradientButton shows loading spinner when loading', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GradientButton(
          text: 'Loading...',
          onPressed: () {},
          loading: true,
        ),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
