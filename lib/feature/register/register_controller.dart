import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/core/model/payload/check_username_payload.dart';
import 'package:myapp/core/model/payload/register_payload.dart';
import 'package:myapp/core/service/api_client.dart';
import 'package:myapp/route/app_routes.dart';
import 'package:myapp/theme/colors.dart';

class RegisterController extends GetxController {
  final api = Get.find<ApiClient>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final isUsernameLoading = false.obs;
  final isButtonLoading = false.obs;
  final isUsernameAvailable = RxnBool();

  final usernameError = RxnString();
  final usernameHelper = RxnString();
  final emailError = RxnString();
  final emailHelper = RxnString();
  final passwordError = RxnString();
  final passwordHelper = RxnString();
  final confirmpasswordError = RxnString();
  final confirmpasswordHelper = RxnString();

  final obscureTextPassword = true.obs;
  final obscureTextConfirm = true.obs;

  final isButtonEnable = false.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(_onUsernameChanged);
    emailController.addListener(_onTextChanged);
    passwordController.addListener(_onTextChanged);
    confirmController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    isButtonEnable.value = _isFormValid();
  }

  void _onUsernameChanged() {
    isUsernameLoading.value = false;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final username = usernameController.text.trim();
      try {
        isUsernameLoading.value = true;
        final res = await api.checkUsername(
          CheckUsernamePayload(username: username),
        );
        isUsernameLoading.value = false;
        if (res.code == 200) {
          isUsernameAvailable.value = res.data?.isUsenameUsed == false;
        } else {
          isUsernameAvailable.value = null;
        }
        usernameError.value = null;
        usernameHelper.value = res.message;
      } catch (e) {
        isUsernameLoading.value = false;
        isUsernameAvailable.value = null;
        if (e is DioException) {
          usernameHelper.value = null;
          usernameError.value = e.response?.data["message"];
        }
      }
    });
  }

  bool _isFormValid() {
    passwordError.value =
        passwordController.text.trim().length >= 6
            ? null
            : "The password of the user (minimum 6 characters)";
    emailError.value =
        emailController.text.isEmail ? null : "The email must be valid";
    confirmpasswordError.value =
        confirmController.text.trim().length >= 6
            ? null
            : "The password of the user (minimum 6 characters)";
    confirmpasswordError.value =
        confirmController.text.trim() == passwordController.text.trim()
            ? null
            : "The password and Confirm Password must be the same";
    return emailController.text.trim().isBlank == false &&
        emailController.text.trim().isEmail == true &&
        passwordController.text.isBlank == false &&
        passwordController.text.trim().length >= 6 &&
        confirmController.text.trim().isBlank == false &&
        confirmController.text.trim().length >= 6 &&
        confirmController.text.trim() == passwordController.text.trim() &&
        isUsernameAvailable.value == true;
  }

  void submit() async {
    isButtonLoading.value = true;
    try {
      final email = emailController.text.trim();
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();
      final res = await api.register(
        RegisterPayload(username: username, email: email, password: password),
      );
      if (res.status) {
        Get.snackbar("Success", res.message, colorText: Colors.green);
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar("Error", res.message, colorText: Colors.red);
      }
    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data["message"];
        Get.snackbar("Error", message, colorText: Colors.red);
      }
    }
    isButtonLoading.value = false;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void register() {}
}
