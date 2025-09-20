import 'package:flutter/material.dart';
import 'informativa_2.dart'; // Importe a nova tela

// A sua tela principal de Onboarding
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Gradiente de fundo
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft, // Início do gradiente na esquerda
                end: Alignment.centerRight, // Fim do gradiente na direita
                colors: [
                  Color(0xFF00978A), // Cor de início do gradiente
                  Color(0xFF0C3A63), // Cor de fim do gradiente
                ],
              ),
            ),
          ),
          
          // 1. O conteúdo da sua tela dentro de um Container arredondado (Parte Branca)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78, // Aumentada a altura para ocupar mais espaço
              decoration: const BoxDecoration(
                color: Colors.white, // Fundo branco
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.0), // Arredondamento ainda maior
                  topRight: Radius.circular(150.0), // Arredondamento ainda maior
                ),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 200), // Este SizedBox já cria o espaço do topo.

                      // Título principal
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Conecte-se com\nempresas de coleta\npersonalizadas para você',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // Adicione um SizedBox aqui para mover o subtítulo para baixo
                      const SizedBox(height: 80),

                      // Subtítulo
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Encontre facilmente empresas para\ndescartar ou doar seu equipamento\neletrônico.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      
                      // Volte este SizedBox para o valor original para manter a posição do botão
                      const SizedBox(height: 80), 

                      // Indicadores de página
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.teal[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),

                      // Botão "Avançar"
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        child: SizedBox(
                          width: 350.0,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione a lógica de navegação aqui
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Informativa2Screen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF028783),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.5),
                              ),
                            ),
                            child: const Text(
                              'Avançar',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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

          // 2. A imagem que fica entre as duas partes (sobre o verde e o branco)
          Positioned(
            top: -43.0, // Valor negativo para que a imagem suba para fora dos limites do Stack
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