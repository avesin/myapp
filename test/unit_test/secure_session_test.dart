import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/core/service/secure_session.dart';

void main() {
  test('SecureSession instantiation', () {
    final session = SecureSession();
    expect(session, isA<SecureSession>());
  });

  // Note: Testing real SecureStorage read/write perlu integration test atau mock.
}