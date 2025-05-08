import 'package:get/get.dart';
import 'package:myapp/core/middleware/auth_middleware.dart';
import 'package:myapp/feature/interest/interest_binding.dart';
import 'package:myapp/feature/interest/interest_view.dart';
import 'package:myapp/feature/login/login_binding.dart';
import 'package:myapp/feature/login/login_view.dart';
import 'package:myapp/feature/profile/profile_binding.dart';
import 'package:myapp/feature/profile/profile_view.dart';
import 'package:myapp/feature/register/register_binding.dart';
import 'package:myapp/feature/register/register_view.dart';

class AppRoutes {
  static const profile = '/profile';
  static const editinterest = '/interest';
  static const login = '/login';
  static const register = '/register';

  static final routes = [
    GetPage(
      name: profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: editinterest,
          page: () => InterestView(),
          binding: InterestBinding(),
        ),
      ],
    ),
    GetPage(name: login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
      name: register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
