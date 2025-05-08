import 'package:flutter/widgets.dart';
import 'package:myapp/theme/colors.dart';

class ConstWidget {
  static Shader shaderGold(Rect bounds) {
    return linearGradientGold.createShader(
      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
    );
  }

  static final linearGradientBlue = const LinearGradient(
    colors: [AppColors.mintLight, AppColors.skyBlue, AppColors.babyBlue],
  );

  static final linearGradientGold = const LinearGradient(
    colors: [
      AppColors.deepOlive,
      AppColors.softGold,
      AppColors.paleCream,
      AppColors.lightPeach,
      AppColors.mutedTan,
      AppColors.paleCream,
    ],
  );
}
