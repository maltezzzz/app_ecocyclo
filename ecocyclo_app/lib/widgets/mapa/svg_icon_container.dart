import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../theme/app_colors.dart'; // Ajuste o caminho conforme sua estrutura real

/// Widget auxiliar para construir um contêiner estilizado para ícones SVG.
/// É usado para os ícones de Recomendação Inteligente e a descrição de filtros.
class SvgIconContainer extends StatelessWidget {
  final String iconPath;
  final Color color;
  final double size;
  final double padding;
  final bool isActive;
  final bool isSmartRecIcon;
  final bool shouldApplyColorFilter;

  const SvgIconContainer({
    super.key,
    required this.iconPath,
    required this.color,
    this.size = 28,
    this.padding = 10,
    required this.isActive,
    this.isSmartRecIcon = false,
    this.shouldApplyColorFilter = true,
  });

  @override
  Widget build(BuildContext context) {
    // A cor de preenchimento é usada se o filtro de cor for aplicado
    final Color iconFillColor = (isSmartRecIcon && isActive) || !isSmartRecIcon 
        ? color 
        : AppColors.textPrimary.withOpacity(0.8);

    final bool shouldBeActiveStyle = isSmartRecIcon && isActive;
    
    final Color borderColor = shouldBeActiveStyle ? color : AppColors.textSecondary.withOpacity(0.5);
    final Color containerColor = shouldBeActiveStyle ? color.withOpacity(0.1) : AppColors.white; 
    final double borderWidth = shouldBeActiveStyle ? 1.5 : 1.0; 

    // Define o ColorFilter. Se shouldApplyColorFilter for false, ele é null.
    final ColorFilter? filter = shouldApplyColorFilter 
        ? ColorFilter.mode(iconFillColor, BlendMode.srcIn)
        : null;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor, 
          width: borderWidth, 
        ),
      ),
      child: SvgPicture.asset(
        iconPath, 
        width: size, 
        height: size,
        colorFilter: filter,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, color: Colors.red, size: size);
        },
      ),
    );
  }
}
