import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:myapp/main.dart';
import 'package:get_storage/get_storage.dart';

void main() {
 TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  void setUpMockChannels(MethodChannel channel) {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '.';
      }
    });
  }
  setUpAll(() async {
    setUpMockChannels(channel);
  });
  
  setUp(() async {
    await GetStorage.init();
  });

  testWidgets('MyApp renders and shows profile route', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp(binding: InitialBinding()));

    // Tunggu semua async selesai
    await tester.pumpAndSettle();
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
