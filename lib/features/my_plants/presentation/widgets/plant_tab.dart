import 'package:flutter/material.dart';
import 'package:genaiproject/core/constants/app_colors.dart';

class PlantTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const PlantTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 2,
          width: 32,
          color: isSelected ? AppColors.primary : Colors.transparent,
        ),
      ],
    );
  }
}
