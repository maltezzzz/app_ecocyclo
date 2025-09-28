// lib/widgets/custom_indicator.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final int activeIndex;
  final int total;

  const CustomIndicator({
    super.key,
    required this.activeIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeIndex == index 
                ? AppColors.secondary 
                : AppColors.textSecondary.withAlpha(128), // ⬅️ Corrected here
          ),
        );
      }),
    );
  }
}