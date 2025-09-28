import 'package:flutter/material.dart';
import 'package:logger/logger.dart'; // ⬅️ Adicionado o import do logger
import '../../theme/app_colors.dart';
import '../../widgets/home/home_header.dart';
import '../../widgets/home/home_disposal_card.dart';
import '../../widgets/home/home_shortcut_icon.dart';
import '../../widgets/home/home_educational_card.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';

// Cria uma instância global do logger para ser usada em todo o arquivo
final logger = Logger();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                onProfilePressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(height: 20),
              const HomeDisposalCard(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeShortcutIcon(
                      title: "Ranking",
                      assetName: "assets/icons/ranking.svg",
                      onTap: () {
                        logger.i('Ranking clicado!');
                      },
                    ),
                    HomeShortcutIcon(
                      title: "Impactos\nAmbientais",
                      assetName: "assets/icons/impact.svg",
                      onTap: () {
                        logger.i('Impactos Ambientais clicado!');
                      },
                    ),
                    HomeShortcutIcon(
                      title: "Recompensas",
                      assetName: "assets/icons/rewards.svg",
                      onTap: () {
                        logger.i('Recompensas clicado!');
                      },
                    ),
                    HomeShortcutIcon(
                      title: "Coleções",
                      assetName: "assets/icons/collections.svg",
                      onTap: () {
                        logger.i('Coleções clicado!');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    logger.i('Seção Educacional clicada!');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            AppColors.gradientRight,
                            AppColors.gradientLeft,
                          ],
                        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: const Row(
                          children: [
                            Text(
                              "Educacional",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: AppColors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios_rounded, size: 18, color: AppColors.textSecondary),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HomeEducationalCard(
                      image: "assets/teclado.png",
                      title: "Teclado estragou?",
                      subtitle: "Entenda como descartar!",
                      onTap: () {
                        logger.i('Card 1 clicado!');
                      },
                    ),
                    HomeEducationalCard(
                      image: "assets/pilha.png",
                      title: "Pilha parou de funcionar?",
                      subtitle: "Descartar de forma segura!",
                      onTap: () {
                        logger.i('Card 2 clicado!');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}