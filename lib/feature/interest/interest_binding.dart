import 'package:get/get.dart';
import 'package:myapp/feature/interest/interest_controller.dart';

class InterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InterestController());
  }
}
