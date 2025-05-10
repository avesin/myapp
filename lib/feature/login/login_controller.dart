import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/core/model/payload/login_payload.dart';
import 'package:myapp/core/service/api_client.dart';
import 'package:myapp/route/app_routes.dart';

class LoginController extends GetxController {
  final authController = Get.find<AuthController>();
  final api = Get.find<ApiClient>();
  final usernameEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final isButtonEnable = false.obs;
  final loading = false.obs;
  final obscurePassword = true.obs;

  bool isFormValid() {
    return usernameEmailController.text.isBlank == false &&
        passwordController.text.isBlank == false;
  }

  void login() async {
    loading.value = true;
    try {
      if (isFormValid()) {
        final password = passwordController.text;
        var email =
            usernameEmailController.text.isEmail
                ? usernameEmailController.text
                : null;
        String? username;
        if (email != null) {
          username = usernameEmailController.text;
        }
        final payload = LoginPayload(
          password,
          email: email,
          username: username,
        );
        final res = await api.login(payload);
        if (res.status &&
            res.data?.access_token != null &&
            res.data?.refresh_token != null) {
          await authController.login(
            res.data!.access_token,
            res.data!.refresh_token,
            res.data!.user,
          );
          Get.offAllNamed(AppRoutes.profile);
        } else {
          final message = res.message;
          Get.snackbar("Error", message, colorText: Colors.red);
        }
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          print('Connection refused or network error');
          // You can show a dialog/snackbar etc.
        } else {
          print('Other Dio error: ${e.message}');
        }
        final message = e.response?.data["message"];
        Get.snackbar("Error", message, colorText: Colors.red);
      }
    }
    loading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    usernameEmailController.addListener(_onTextChanged);
    passwordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    isButtonEnable.value = isFormValid();
  }
}
