import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:myapp/core/model/data/profile.dart';

class SecureSession {
  static const String profile = "profile";

  final storage = const FlutterSecureStorage();
  Future<void> saveProfile(Profile data) async {
    final jsonString = jsonEncode(data.toJson());
    await storage.write(key: profile, value: jsonString);
  }

  Future<Profile?> getProfile() async {
    final jsonString = await storage.read(key: profile);
    try {
      if (jsonString?.isBlank == false) {
        Map<String, dynamic> data = jsonDecode(jsonString ?? "");
        return Profile.fromJson(data);
      }
    } catch (e) {
      e.printError();
    }
    return null;
  }
}
