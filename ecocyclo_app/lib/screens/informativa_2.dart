import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_indicator.dart';

class Informativa2Screen extends StatelessWidget {
  const Informativa2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Fundo gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.gradientRight,
                  AppColors.gradientLeft,
                ],
              ),
            ),
          ),

          // Parte branca com borda preta
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(150.0),
                  topRight: Radius.circular(150.0),
                ),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 190),

                      // Título
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Acompanhe e obtenha\n relatórios completos sobre\n seus descartes',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Subtítulo
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Acompanhe o impacto ambiental e\n obtenha relatórios detalhados para\n comprovar ações sustentáveis, melhorar\n processos internos e fortalecer sua\n imagem perante clientes e parceiros.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Indicadores de página
                      const CustomIndicator(activeIndex: 1, total: 2),
                      const SizedBox(height: 20),

                      // Botão "Começar"
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: SizedBox(
                          width: 350,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.5),
                              ),
                            ),
                            child: const Text(
                              'Começar',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                fontFamily: 'Poppins',
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

          // Imagem central
          Positioned(
            top: 120.0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.25 * 255).toInt()),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/graf.jpg',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Botão de voltar
          Positioned(
            top: 40.0,
            left: 20.0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
