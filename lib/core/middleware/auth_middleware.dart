import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/route/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    if (!authController.isLoggedIn()) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
