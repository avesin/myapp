import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/feature/interest/interest_controller.dart';
import 'package:myapp/widget/home_background.dart';

class InterestView extends GetView<InterestController> {
  const InterestView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      onTabSave: () {
        controller.saveData();
      },
      isMoreButton: false,
      isSaveButton: true,
      child: Align(
        alignment: const Alignment(0, -0.4),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Tell everyone about yourself',
                  style: TextStyle(
                    color: Color(0xFFF3EDA6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'What interest you?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(13),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Obx(
                    () => Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...controller.interests
                            .map(
                              (interest) => SizedBox(
                                height: 42,
                                child: Chip(
                                  label: Text(
                                    interest,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.white.withAlpha(0),
                                  deleteIcon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  onDeleted: () {
                                    controller.remove(interest);
                                  },
                                ),
                              ),
                            )
                            .toList(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 80,
                            minHeight: 42,
                            maxHeight: 42,
                          ),
                          child: IntrinsicWidth(
                            child: TextField(
                              controller: controller.textController,
                              focusNode: controller.focusNode,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 12,
                                ),
                              ),
                              onSubmitted: (value) {
                                if (value.trim().isNotEmpty) {
                                  controller.submit(value);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
