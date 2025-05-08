import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.whiteGreeny,
                border: Border.all(color: Colors.white.withAlpha(50)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: value,
                icon: Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                underline: const SizedBox(),
                dropdownColor: AppColors.lightGreen,
                style: const TextStyle(color: Colors.white),
                iconEnabledColor: Colors.white,
                items:
                    items
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(item),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
