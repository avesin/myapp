import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:get/get.dart';

void main() {
  test('AuthController can be instantiated', () {
    final controller = Get.put(AuthController());
    expect(controller, isA<AuthController>());
  });

  // Note: Untuk test login real perlu mock ApiClient dan dependency GetStorage.
}