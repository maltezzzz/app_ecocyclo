// lib/widgets/home/home_shortcut_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_colors.dart';

class HomeShortcutIcon extends StatelessWidget {
  final String title;
  final String assetName;
  final VoidCallback onTap;

  const HomeShortcutIcon({
    super.key,
    required this.title,
    required this.assetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.secondary, width: 4), // Usando o novo AppColors
              color: AppColors.white, // Usando o novo AppColors
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5), // Ajuste para mover o ícone para baixo
                  SvgPicture.asset(
                    assetName,
                    width: 55,
                    height: 55,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 35, // Altura fixa para o texto, o suficiente para 2 linhas
            width: 80,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient( // Use const aqui
                  colors: [AppColors.gradientRight, AppColors.gradientLeft], // Usando o novo AppColors
                ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: AppColors.white, // Usando o novo AppColors (será mascarado pelo ShaderMask)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}