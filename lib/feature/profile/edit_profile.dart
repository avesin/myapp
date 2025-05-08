import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/util/global_utils.dart';
import 'package:myapp/feature/profile/profile_controller.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widget/const_widget.dart';
import 'package:myapp/widget/dropdown_field.dart';
import 'package:myapp/widget/editable_field.dart';
import 'package:myapp/widget/gradient_text.dart';

class EditProfile extends GetView<ProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Save button
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
              GestureDetector(
                onTap: () {
                  controller.toggleEdit();
                  controller.saveData();
                },
                child: GradientText(
                  'Save & Update',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  gradient: ConstWidget.linearGradientGold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Image and Add image label
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.pickImage(),
                child:
                    controller.imageBase64.value != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(
                            base64Decode(controller.imageBase64.value!),
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(32),
                            borderRadius: BorderRadius.circular(
                              18,
                            ), // rounded corners
                          ),
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return ConstWidget.shaderGold(bounds);
                              },
                              child: Icon(
                                Icons.add,
                                size: 32,
                                color:
                                    Colors
                                        .white, // actual color will be overridden by gradient
                              ),
                            ),
                          ),
                        ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Add image',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Input fields
          EditableField(
            controller: controller.displayTextController,
            label: 'Display name:',
            hint: 'Enter Name',
          ),
          DropdownField(
            label: 'Gender:',
            value: controller.gender.value,
            items: ["Male", "Female"],
            onChanged: (value) => {controller.setGender(value)},
          ),
          EditableField(
            hint: 'DD MM YYYY',
            controller: controller.birtDateTextController,
            label: 'Birthday:',
            readOnly: false,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(1995, 8, 28),
                firstDate: DateTime(1900),
                lastDate: GlobalUtils.lastDateCapableToSignUp(),
              );
              controller.setBirthDate(pickedDate);
            },
          ),
          EditableField(
            hint: "--",
            controller: controller.horoscopeTextController,
            label: 'Horoscope:',
            readOnly: true,
          ),
          EditableField(
            hint: "--",
            controller: controller.zodiacTextController,
            label: 'Zodiac:',
            readOnly: true,
          ),
          EditableField(
            hint: "Add Height",
            controller: controller.heightTextController,
            label: 'Height:',
            surfix: "cm",
            keyboardType: TextInputType.numberWithOptions(decimal: false),
          ),
          EditableField(
            hint: "Add Weight",
            controller: controller.weightTextController,
            label: 'Weight:',
            surfix: "kg",
            keyboardType: TextInputType.numberWithOptions(decimal: false),
          ),
        ],
      ),
    );
  }
}
