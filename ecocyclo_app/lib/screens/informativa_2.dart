import 'package:flutter/material.dart';

// A sua tela principal de Onboarding (segunda página)
class Informativa2Screen extends StatelessWidget {
  const Informativa2Screen({super.key});

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
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF00978A),
                  Color(0xFF0C3A63),
                ],
              ),
            ),
          ),

          // 1. O conteúdo da sua tela dentro de um Container arredondado (Parte Branca)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.0),
                  topRight: Radius.circular(150.0),
                ),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 200),
                      // Título principal
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Acompanhe e obtenha\n relatórios completos sobre\n seus descartes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      // Adiciona um SizedBox aqui para mover o subtítulo para baixo
                      const SizedBox(height: 60),
                      // Subtítulo
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'Acompanhe o impacto ambiental e\n obtenha relatórios detalhados para\n comprovar ações sustentáveis, melhorar\n processos internos e fortalecer sua\n imagem perante clientes e parceiros.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      // Indicadores de página
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.teal[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Botão "Começar"
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        child: SizedBox(
                          width: 350.0,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica de navegação para a tela final
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF028783),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.5),
                              ),
                            ),
                            child: const Text(
                              'Começar',
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
            top: -43.0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/graf.jpg',
              width: 300,
            ),
          ),

          // Novo Botão de Voltar no canto superior esquerdo
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
                Navigator.pop(context); // Retorna à tela anterior
              },
            ),
          ),
        ],
      ),
    );
  }
}