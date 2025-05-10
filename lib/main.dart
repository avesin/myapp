import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/core/controller/theme_controller.dart';
import 'package:myapp/core/interceptor/auth_interceptor.dart';
import 'package:myapp/core/service/api_client.dart';
import 'package:myapp/core/service/compress_image.dart';
import 'package:myapp/core/service/secure_session.dart';
import 'package:myapp/route/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  //Initialize Logging
  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
      LogLevel.WARNING,
      LogLevel.ERROR,
      LogLevel.SEVERE,
    ],
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    directoryStructure: DirectoryStructure.FOR_DATE,
    logTypesEnabled: ["device", "network", "errors"],
    logFileExtension: LogFileExtension.LOG,
    logsWriteDirectoryName: "MyLogs",
    logsExportDirectoryName: "MyLogs/Exported",
    debugFileOperations: true,
    isDebuggable: true,
    enabled: true,
  );
  runApp(MyApp(binding: InitialBinding()));
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());
  final InitialBinding binding;

  MyApp({required this.binding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        initialBinding: binding,
        title: 'Absen',
        theme: themeController.theme.value,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.profile,
        getPages: AppRoutes.routes,
      ),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(SecureSession(), permanent: true);
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15), // ⏳ receive timeout
        sendTimeout: const Duration(seconds: 15), // ⏳ send timeout
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
    final baseUrl = dotenv.env['API_URL'];
    final apiClient = ApiClient(dio, baseUrl: baseUrl);
    Get.put<ApiClient>(apiClient);
    dio.interceptors.add(AuthInterceptor(baseDio: dio));
    Get.put(ImagePicker());
    Get.put(CompressImage());
  }
}
