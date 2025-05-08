import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/feature/profile/edit_profile.dart';
import 'package:myapp/feature/profile/profile_controller.dart';
import 'package:myapp/feature/profile/banner_card.dart';
import 'package:myapp/feature/profile/view_profile.dart';
import 'package:myapp/route/app_routes.dart';
import 'package:myapp/widget/Interest_chip.dart';
import 'package:myapp/widget/home_background.dart';
import 'package:myapp/widget/info_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HomeBackground(
        title: "@${controller.usermame.value}",
        isMoreButton: true,
        onTapMore: () => {},
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner / header box
                BannerCard(
                  "${controller.usermame.value}",
                  age: controller.age.value,
                  gender: controller.gender.value,
                  zodiac: controller.zodiac.value,
                  horoscope: controller.horos.value,
                  imageBase64: controller.imageBase64.value,
                ),
                const SizedBox(height: 16),
                // About
                controller.isEdit.value
                    ? EditProfile()
                    : controller.isDataEmpty()
                    ? InfoCard(
                      title: 'About',
                      content:
                          'Add in your your to help others know you better',
                      onEdit: () {
                        controller.toggleEdit();
                      },
                    )
                    : ViewProfile(),
                const SizedBox(height: 16),
                // Interest
                InfoCard(
                  title: 'Interest',
                  content:
                      controller.interests.isEmpty
                          ? 'Add in your interest to find a better match'
                          : null,
                  child:
                      controller.interests.isNotEmpty
                          ? Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              controller.interests.length,
                              (i) {
                                return TagChip(controller.interests[i]);
                              },
                            ),
                          )
                          : null,
                  onEdit: () async {
                    final r = await Get.toNamed(AppRoutes.profile + AppRoutes.editinterest);
                    print("onEdit ${r}");
                    controller.getInterest();
                  },
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
