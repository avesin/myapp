import 'package:get/get.dart';
import 'package:myapp/theme/app_theme.dart';

class ThemeController extends GetxController {
  var theme = darkTheme.obs;

  void toggleTheme() {
    theme.value = darkTheme;
  }
}