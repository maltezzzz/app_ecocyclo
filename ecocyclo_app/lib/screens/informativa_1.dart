import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_indicator.dart';
class Informativa1Screen extends StatelessWidget {
  const Informativa1Screen({super.key});

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
                      const SizedBox(height: 200),

                      // Título
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Conecte-se com\nempresas de coleta\npersonalizadas para você',
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
                          'Encontre facilmente empresas para\ndescartar ou doar seu equipamento\neletrônico.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),

                      // Indicadores de página
                      const CustomIndicator(activeIndex: 0, total: 2),
                      const SizedBox(height: 20),

                      // Botão "Avançar"
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: SizedBox(
                          width: 350,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/informativa2');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.5),
                              ),
                            ),
                            child: const Text(
                              'Avançar',
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

          // Imagem entre o gradiente e a parte branca
          Positioned(
            top: -43.0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/loc.png',
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}