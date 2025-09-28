import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import '../../theme/app_colors.dart';

final logger = Logger();

class SettingsMenuButton extends StatelessWidget {
  final String text;
  final String? svgIconPath;
  final LinearGradient? textGradient;
  final VoidCallback? onPressed; // <-- Adicionado

  const SettingsMenuButton({
    super.key,
    required this.text,
    this.svgIconPath,
    this.textGradient,
    this.onPressed, // <-- Adicionado
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: GestureDetector(
        onTap: onPressed ?? () => logger.i("$text clicado!"), // <-- Usa onPressed se fornecido
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.gradientRight, AppColors.gradientLeft],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Row(
                children: [
                  if (svgIconPath != null)
                    SvgPicture.asset(
                      svgIconPath!,
                      width: 30,
                      height: 30,
                      colorFilter: const ColorFilter.mode(
                        AppColors.gradientLeft,
                        BlendMode.srcIn,
                      ),
                    ),
                  if (svgIconPath != null) const SizedBox(width: 12),
                  Expanded(
                    child: Center(
                      child: textGradient != null
                          ? ShaderMask(
                              shaderCallback: (bounds) =>
                                  textGradient!.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [AppColors.gradientRight, AppColors.gradientLeft],
                              ).createShader(bounds),
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
