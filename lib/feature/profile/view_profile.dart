import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myapp/core/util/global_utils.dart';
import 'package:myapp/feature/profile/profile_controller.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widget/info_item.dart';

class ViewProfile extends GetView<ProfileController> {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 24),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Edit Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/edit_icon.svg',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  controller.toggleEdit();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Information items
          if (controller.getBirthDate() != null)
            InfoItem(
              label: 'Birthday:',
              value:
                  '${GlobalUtils.formatDate(controller.getBirthDate()!, pattern: "dd / MM / yyyy")} (Age ${GlobalUtils.calculateAge(controller.getBirthDate()!)})',
            ),
          const SizedBox(height: 16),
          InfoItem(
            label: 'Horoscope:',
            value: controller.horos.value?.displayName ?? "",
          ),
          const SizedBox(height: 16),
          InfoItem(
            label: 'Zodiac:',
            value: controller.zodiac.value?.displayName ?? "",
          ),
          const SizedBox(height: 16),
          InfoItem(label: 'Height:', value: '${controller.height.value ?? 0} cm'),
          const SizedBox(height: 16),
          InfoItem(label: 'Weight:', value: '${controller.weight.value ?? 0} kg'),
        ],
      ),
    );
  }
}
