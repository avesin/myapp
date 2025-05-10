import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myapp/main.dart'; // pastikan import MyApp

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login flow test', (tester) async {
    await tester.pumpWidget(MyApp(binding: InitialBinding()));
    await tester.pumpAndSettle();

    // Pastikan ada halaman login
    expect(find.text('Login'), findsOneWidget);

    // Isi email & password
    await tester.enterText(find.byType(TextFormField).at(0), 'test@email.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');

    // Tap tombol Login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verifikasi apakah profile muncul (ubah sesuai teks di ProfileView)
    expect(find.textContaining('Profile'), findsWidgets);
  });
}
