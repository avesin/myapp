import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/route/app_routes.dart';
import 'package:myapp/widget/const_widget.dart';
import 'package:myapp/widget/gradient_text.dart';

class MyAppBar extends GetView<AuthController> implements PreferredSizeWidget {
  final String? title;
  final bool isMoreButton;
  final bool isSaveButton;
  final VoidCallback? onTapMore;
  final VoidCallback? onTapSave;

  const MyAppBar({
    super.key,
    this.title,
    required this.isMoreButton,
    required this.isSaveButton,
    this.onTapMore,
    this.onTapSave,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: title != null ? Text(title!) : null,
      automaticallyImplyLeading: true, // this is TRUE by default!
      actions: [
        if (isMoreButton && onTapMore != null)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz),
            onSelected: (value) {
              if (value == 'settings') {
                // Navigate to settings or perform action
              }
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: const Text('Logout'),
                    onTap: () async {
                      controller.logout();
                      Get.offAllNamed(AppRoutes.login);
                    },
                  ),
                ],
          ),
        if (isSaveButton && onTapSave != null)
          TextButton(
            onPressed: () => {onTapSave!()},
            child: GradientText(
              'Save',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
              gradient: ConstWidget.linearGradientBlue,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
