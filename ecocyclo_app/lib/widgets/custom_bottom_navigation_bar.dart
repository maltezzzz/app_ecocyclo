// lib/widgets/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart'; // Importe o pacote logger
import '../theme/app_colors.dart'; // Importa AppColors

// Crie uma instância global do logger
final logger = Logger();

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, bottom: 20),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              // TODO: Lógica para o botão Home
              logger.i('Home clicado!');
            },
            child: SvgPicture.asset("assets/icons/home.svg", width: 30, height: 30),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Lógica para o botão Mapa
              logger.i('Mapa clicado!');
            },
            child: SvgPicture.asset("assets/icons/map.svg", width: 30, height: 30),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Lógica para o botão Chat
              logger.i('Chat clicado!');
            },
            child: SvgPicture.asset("assets/icons/chat.svg", width: 30, height: 30),
          ),
        ],
      ),
    );
  }
}