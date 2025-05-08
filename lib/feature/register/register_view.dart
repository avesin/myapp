import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/feature/register/register_controller.dart';
import 'package:myapp/route/app_routes.dart';
import 'package:myapp/widget/app_background.dart';
import 'package:myapp/widget/const_widget.dart';
import 'package:myapp/widget/gradient_button.dart';
import 'package:myapp/widget/gradient_text.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Align(
        alignment: const Alignment(0, -0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            const SizedBox(height: 32),

            // Form fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Obx(
                () => Column(
                  children: [
                    // Email
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        errorText: controller.emailError.value,
                        hintText: 'Enter Email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Username
                    TextField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        helperText: controller.usernameHelper.value,
                        errorText: controller.usernameError.value,
                        hintText: 'Create Username',
                        suffixIcon:
                            controller.isUsernameLoading.value
                                ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                                : controller.isUsernameAvailable.value == null
                                ? null
                                : controller.isUsernameAvailable.value == true
                                ? const Icon(Icons.check, color: Colors.green)
                                : const Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Password
                    TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscureTextPassword.value,
                      decoration: InputDecoration(
                        errorText: controller.passwordError.value,
                        hintText: 'Create Password',
                        suffixIcon: ShaderMask(
                          shaderCallback: ConstWidget.shaderGold,
                          child: IconButton(
                            icon: Icon(
                              controller.obscureTextPassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () =>
                                    controller.obscureTextPassword.value =
                                        !controller.obscureTextPassword.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Confirm Password
                    TextField(
                      controller: controller.confirmController,
                      obscureText: controller.obscureTextConfirm.value,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        errorText: controller.confirmpasswordError.value,
                        suffixIcon: ShaderMask(
                          shaderCallback: ConstWidget.shaderGold,
                          child: IconButton(
                            icon: Icon(
                              controller.obscureTextConfirm.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () =>
                                    controller.obscureTextConfirm.value =
                                        !controller.obscureTextConfirm.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Register Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => GradientButton(
                  text: 'Register',
                  onPressed: () {
                    controller.submit();
                  },
                  loading: controller.isButtonLoading.value,
                  disabled:
                      !controller
                          .isButtonEnable
                          .value, // Disabled as shown in the screenshot
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Login link
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.login);
                    },
                    child: GradientText(
                      'Login here',
                      gradient: ConstWidget.linearGradientGold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
