import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp/core/model/payload/interest_payload.dart';
import 'package:myapp/core/service/api_client.dart';

class InterestController extends GetxController {
  final api = Get.find<ApiClient>();
  final TextEditingController textController = TextEditingController();
  final focusNode = FocusNode();

  RxList<String> interests = RxList<String>();

  void remove(String item) {
    interests.remove(item);
  }

  void submit(String item) {
    interests.add(item);
    textController.clear();
    focusNode.requestFocus();
  }

  @override
  void onInit() {
    super.onInit();
    getDataInterest();
  }

  void saveData() async {
    print('API Response: 1');
    try {
      final res = await api.updateInterest(InterestPayload(interests));
      print('API Response: ${res}');
      if (res.status) {
        Get.back();
      }
    } catch (e) {
      e.printError();
      print('API Response: erro ${e}');
    }
    print('API Response: end');
  }

  void getDataInterest() async {
    try {
      final res = await api.getInterest();
      if (res.status && res.data != null) {
        interests.value = res.data!.values.map((a) => a ?? "").toList();
      }
    } catch (e) {
      e.printError();
    }
  }
}
