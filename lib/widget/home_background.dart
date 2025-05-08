import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widget/app_bar.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? isMoreButton;
  final bool? isSaveButton;
  final VoidCallback? onTapMore;
  final VoidCallback? onTabSave;

  const HomeBackground({
    super.key,
    this.title,
    this.isMoreButton,
    this.isSaveButton,
    this.onTapMore,
    this.onTabSave,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        title: title,
        isMoreButton: isMoreButton ?? true,
        onTapMore: onTapMore,
        isSaveButton: isSaveButton ?? false,
        onTapSave: onTabSave,
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(color: AppColors.deepGreen),
        child: SafeArea(child: child),
      ),
    );
  }
}
