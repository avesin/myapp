import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/core/controller/auth_controller.dart';
import 'package:myapp/core/enum/shio.dart';
import 'package:myapp/core/enum/zodiac.dart';
import 'package:myapp/core/model/payload/profile_payload.dart';
import 'package:myapp/core/service/api_client.dart';
import 'package:myapp/core/service/compress_image.dart';
import 'package:myapp/core/util/global_utils.dart';
import 'package:myapp/theme/colors.dart';

class ProfileController extends GetxController {
  final authController = Get.find<AuthController>();
  final api = Get.find<ApiClient>();
  final _imagePicker = Get.find<ImagePicker>();
  final _compressImage = Get.find<CompressImage>();

  var displayTextController = TextEditingController();
  var birtDateTextController = TextEditingController();
  var horoscopeTextController = TextEditingController();
  var zodiacTextController = TextEditingController();
  var heightTextController = TextEditingController();
  var weightTextController = TextEditingController();

  var isEdit = false.obs;
  var usermame = RxnString();
  var fullname = RxnString();
  var gender = RxnString();
  var age = RxnInt();
  var birthdate = RxnString();
  var zodiac = Rxn<Zodiac>();
  var horos = Rxn<Horoscope>();
  var height = RxnInt();
  var weight = RxnInt();
  var interests = RxList<String>();
  ProfilePayload? _oldData;

  var imageBase64 = RxnString();

  @override
  void onInit() {
    super.onInit();
    ever(birthdate, (String? dateStr) {
      if (dateStr != null) {
        age.value = GlobalUtils.calculateAge(GlobalUtils.parseDate(dateStr));
      } else {
        age.value = null;
      }
    });
    displayTextController.addListener(_onTextChange);
    heightTextController.addListener(_onTextChange);
    weightTextController.addListener(_onTextChange);

    getInterest();
    getProfile();
  }

  void getInterest() async {
    try {
      final res = await api.getInterest();
      if (res.status) {
        interests.value = res.data!.values.map((a) => a ?? "").toList();
      }
    } catch (e) {
      e.printError();
    }
  }

  void getProfile() async {
    try {
      final res = await api.profile();
      if (res.status) {
        final profile = res.data;
        if (profile != null) {
          _setProfile(profile);
        }
      }
    } catch (e) {
      e.printError();
    }
  }

  void _setProfile(ProfilePayload profile) {
    _oldData = profile;
    fullname.value = profile.fullname;
    displayTextController.text = profile.fullname ?? "";
    gender.value = profile.gender?.capitalizeFirst;
    if (profile.birthdate != null) {
      birthdate.value = GlobalUtils.formatDate(profile.birthdate!);
      birtDateTextController.text = birthdate.value ?? "";
      age.value = GlobalUtils.calculateAge(profile.birthdate!);
      zodiac.value = GlobalUtils.getZodiacByDate(profile.birthdate!);
      zodiacTextController.text = zodiac.value?.displayName ?? "";
      horos.value = GlobalUtils.getHoroscopeByDate(profile.birthdate!);
      horoscopeTextController.text = horos.value?.displayName ?? "";
    }
    height.value = profile.height;
    heightTextController.text = profile.height.toString();
    weight.value = profile.weight;
    weightTextController.text = profile.weight.toString();
    imageBase64.value = profile.image?.replaceAll("data:image/jpeg;base64,", "");
  }

  void _onTextChange() {
    if (fullname.value != displayTextController.text) {
      fullname.value = displayTextController.text;
    }
    if (height.value != int.tryParse(heightTextController.text)) {
      height.value = int.tryParse(heightTextController.text);
    }
    if (weight.value != int.tryParse(weightTextController.text)) {
      weight.value = int.tryParse(weightTextController.text);
    }
  }

  @override
  void onReady() {
    super.onReady();
    usermame.value = authController.getUser()?.username;
  }

  bool isDataEmpty() {
    var data =
        fullname.value?.isBlank != false &&
        gender.value?.isBlank != false &&
        birthdate.value?.isBlank != false &&
        height.value?.isBlank != false &&
        weight.value?.isBlank != false;
    return data;
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
  }

  bool isDifference() {
    if (_oldData != null) {
      return _oldData?.fullname != fullname.value ||
          GlobalUtils.formatDate(_oldData!.birthdate!) != birthdate.value ||
          _oldData?.gender?.toLowerCase() != gender.value?.toLowerCase() ||
          _oldData?.height != height.value ||
          _oldData?.weight != weight.value ||
          _oldData?.image?.replaceAll("data:image/jpeg;base64,", "") != imageBase64.value
        ;
    }
    return true;
  }

  void saveData() async {
    try {
      if (isDifference()) {
        final res = await api.updateProfile(
          ProfilePayload(
            fullname.value,
            gender.value,
            GlobalUtils.parseDate(birthdate.value ?? ""),
            height.value,
            weight.value,
            "data:image/jpeg;base64,${imageBase64.value}"
          ),
        );
        if (res.data != null) {
          _setProfile(res.data!);
        }
        Get.snackbar("Info", res.message, colorText: AppColors.mintAccent);
      }
    } catch (e) {
      e.printError();
    }
  }

  void setGender(String? gender) {
    this.gender.value = gender;
  }

  void setBirthDate(DateTime? date) {
    if (date != null) {
      birthdate.value = GlobalUtils.formatDate(date);
      zodiac.value = GlobalUtils.getZodiacByDate(date);
      horos.value = GlobalUtils.getHoroscopeByDate(date);

      birtDateTextController.text = birthdate.value ?? "";
      zodiacTextController.text = zodiac.value?.displayName ?? "";
      horoscopeTextController.text = horos.value?.displayName ?? "";
    }
  }

  DateTime? getBirthDate() {
    if (birthdate.value != null) {
      return GlobalUtils.parseDate(birthdate.value!);
    }

    return null;
  }

  Future<void> pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      print('Path gambar: ${image.path}');
      File file = File(image.path);
      final base64 = await _compressImage.compressImageToBase64(file);
      imageBase64.value = base64;
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
  }

  @override
  void dispose() {
    displayTextController.dispose();
    birtDateTextController.dispose();
    horoscopeTextController.dispose();
    zodiacTextController.dispose();
    heightTextController.dispose();
    weightTextController.dispose();
    super.dispose();
  }
}
