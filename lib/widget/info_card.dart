import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/theme/colors.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? child;
  final VoidCallback onEdit;

  const InfoCard({
    required this.title,
    required this.onEdit,
    this.content,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/edit_icon.svg',
                  width: 20,
                  height: 20,
                ),
                onPressed: onEdit,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (content != null)
            Text(
              content!,
              style: TextStyle(color: AppColors.white.withAlpha(100)),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
