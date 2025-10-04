// lib/widgets/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart'; // Importe o pacote logger
import '../theme/app_colors.dart'; // Importa AppColors

// Crie uma instância global do logger
final logger = Logger();

class CustomBottomNavigationBar extends StatelessWidget {
  // 1. Adicione um callback para o evento de clique no mapa
  final VoidCallback? onMapTap;

  const CustomBottomNavigationBar({
    super.key,
    this.onMapTap, // 2. Adicione-o ao construtor
  });

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
          
          // BOTÃO MAPA ALTERADO
          GestureDetector(
            onTap: () {
              // 3. Em vez de navegar aqui, chame o callback
              logger.i('Mapa clicado! Acionando callback...');
              onMapTap?.call(); // Chama a função que será definida na tela Home
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