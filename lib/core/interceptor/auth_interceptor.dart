import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/core/model/payload/token_payload.dart';
import 'package:myapp/core/service/api_client.dart';

class AuthInterceptor extends dio.InterceptorsWrapper {
  dio.Dio baseDio;
  final authController = Get.find<AuthController>();
  final api = Get.find<ApiClient>();

  AuthInterceptor({required this.baseDio});

  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    final token = 'Bearer ${authController.getToken()}';
    options.headers['Authorization'] = token;
    return handler.next(options);
  }

  @override
  void onResponse(
    dio.Response response,
    dio.ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(dio.DioException e, dio.ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401) {
      try {
        final refreshToken = authController.getRefreshToken();
        final res = await api.refreshToken(TokenPayload(refreshToken ?? ""));
        if (res.status &&
            res.data?.access_token != null &&
            res.data?.refresh_token != null) {
          final t = res.data!.access_token;
          final r = res.data!.refresh_token;
          await authController.login(t, r, null);
          e.requestOptions.headers['Authorization'] = 'Bearer $t';
          final clonedRequest = await baseDio.fetch(e.requestOptions);
          return handler.resolve(clonedRequest);
        } else {
          return handler.next(e);
        }
      } catch (refreshError) {
        // If refresh also fails, forward the original error
        return handler.next(e);
      }
    } else {
      // Not a 401 error, forward as usual
      return handler.next(e);
    }
  }
}
