import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlined;
  final TextStyle? textStyle;
  final double? width;
  final List<Color>? gradientColors; 

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
    this.textStyle,
    this.width,
    this.gradientColors, 
  });

  Widget _buildText() {
    final TextStyle defaultTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.primary, 
    );
    
    // Mescla o estilo padrão com o estilo customizado (GoogleFonts, etc.)
    final TextStyle finalTextStyle = defaultTextStyle.merge(textStyle);

    if (gradientColors != null && gradientColors!.isNotEmpty) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: gradientColors!,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ).createShader(bounds);
        },
        child: Text(
          text,
          style: finalTextStyle.copyWith(
            color: Colors.white, 
          ),
        ),
      );
    }
    
    return Text(
      text,
      style: finalTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: width ?? double.infinity,
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.white, 
                foregroundColor: AppColors.primary, 
                padding: const EdgeInsets.symmetric(vertical: 15),
                side: const BorderSide(color: AppColors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: _buildText(), 
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.primary, 
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: _buildText(), 
            ),
    );
  }
}