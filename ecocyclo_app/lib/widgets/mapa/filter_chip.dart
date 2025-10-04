import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../theme/app_colors.dart'; // Ajuste o caminho conforme sua estrutura real

/// Widget para exibir um filtro de categoria já selecionado (o chip na parte superior).
class FilterChipWidget extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color color;
  final VoidCallback onRemove;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.color,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final Widget avatarWidget = SvgPicture.asset(
      iconPath, 
      width: 20, 
      height: 20,
      // Não aplica ColorFilter para manter as cores originais do SVG
    );
    
    return ActionChip(
      avatar: avatarWidget,
      label: Text(label),
      onPressed: onRemove,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(color: Colors.grey, width: 0.5),
      ),
      labelStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      elevation: 2,
      shadowColor: Colors.black26,
    );
  }
}
