import 'package:get/get.dart';
import 'package:myapp/feature/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
