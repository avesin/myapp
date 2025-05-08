import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';

class EditableField extends StatelessWidget {
  final String label;
  final String hint;
  final String? surfix;
  final bool readOnly;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  const EditableField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.readOnly = false,
    this.surfix,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(color: Colors.white.withAlpha(120)),
            ),
          ),
          Expanded(
            flex: 6,
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: keyboardType,
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                suffixText: surfix,
                fillColor: AppColors.whiteGreeny,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withAlpha(50)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
