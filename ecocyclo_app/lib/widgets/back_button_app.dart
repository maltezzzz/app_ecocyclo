import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BackButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonApp({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      left: 20.0,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 30.0,
        ),
        onPressed: onPressed ?? () => Navigator.pop(context),
      ),
    );
  }
}
