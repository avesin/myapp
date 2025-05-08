import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/feature/login/login_controller.dart';
import 'package:myapp/route/app_routes.dart';
import 'package:myapp/widget/app_background.dart';
import 'package:myapp/widget/const_widget.dart';
import 'package:myapp/widget/gradient_button.dart';
import 'package:myapp/widget/gradient_text.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Align(
        alignment: const Alignment(0, -0.4),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 32),

                    // Username / Email
                    TextField(
                      controller: controller.usernameEmailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Username/Email',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextField(
                      obscureText: controller.obscurePassword.value,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obscurePassword.value =
                                !controller.obscurePassword.value;
                          },
                          icon: ShaderMask(
                            shaderCallback: ConstWidget.shaderGold,
                            child: Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:
                // Login Button
                GradientButton(
                  text: 'Login',
                  onPressed: () {
                    controller.login();
                  },
                  loading: controller.loading.value,
                  disabled:
                      !controller.isButtonEnable.value, // As in the screenshot
                ),
              ),

              const SizedBox(height: 32),

              // Register link
              Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'No account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: GradientText(
                        'Register here',
                        gradient: ConstWidget.linearGradientGold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
