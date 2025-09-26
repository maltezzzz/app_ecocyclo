import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final String iconPath; 
  final bool obscureText;
  final double? width; 

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.obscureText = false,
    this.width, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(color: Color.fromARGB(136, 255, 255, 255)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(166, 255, 255, 255)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white, width: 2.0),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn), 
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}