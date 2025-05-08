import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widget/app_bar.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final String? title;

  const AppBackground({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(title: title, isMoreButton: false, isSaveButton: false),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            center: Alignment(1.0, -0.9),
            radius: 2.8,
            colors: [
              AppColors.slateTeal,
              AppColors.darkTeal,
              AppColors.deepGreen,
            ],
          ),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
