import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/core/model/data/user.dart';

class AuthController extends GetxController {
  final RxnString _token = RxnString();
  final RxnString _refreshToken = RxnString();
  final Rxn<User> _user = Rxn<User>();
  final box = GetStorage();

  @override
  void onInit() {
    final token = box.read<String>('token');
    final refreshToken = box.read<String>('refresh_token');
    final user = box.read('user');
    if (token != null && refreshToken != null) {
      _token.value = token;
      _refreshToken.value = refreshToken;
    }
    if (user != null) {
      _user.value = User.fromJson(user);
    }
    super.onInit();
  }

  Future<void> login(String token, String refreshToken, User? user) async {
    _token.value = token;
    _refreshToken.value = refreshToken;
    await box.write("token", token);
    await box.write("refresh_token", refreshToken);
    if (user != null) {
      await box.write("user", user);
    }
    await box.save();
  }

  void logout() async {
    _token.value = null;
    _refreshToken.value = null;
    await box.remove("token");
    await box.remove("refresh_token");
  }

  bool isLoggedIn() {
    return (_token.value != null && _token.value?.isNotEmpty == true) &&
        (_refreshToken.value != null &&
            _refreshToken.value?.isNotEmpty == true);
  }

  String? getToken() {
    if (_token.value == null) {
      _token.value = box.read("token");
    }
    return _token.value;
  }

  String? getRefreshToken() {
    if (_refreshToken.value == null) {
      _refreshToken.value = box.read("refresh_token");
    }
    return _refreshToken.value;
  }

  User? getUser() {
    return _user.value;
  }
}
