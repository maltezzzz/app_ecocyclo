import 'package:flutter/material.dart';
import 'informativa_2.dart'; // Importe a nova tela

// A sua tela principal de Onboarding
class Informativa1Screen extends StatelessWidget {
  const Informativa1Screen({super.key});

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
          
          // 1. O conteúdo da sua tela dentro de um Container arredondado (Parte Branca) com borda preta
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(150.0),
                  topRight: Radius.circular(150.0),
                ),
                border: Border.all(
                  color: Colors.black, // borda preta
                  width: 2.0,          // espessura da borda
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
                          'Conecte-se com\nempresas de coleta\npersonalizadas para você',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

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
                      
                      const SizedBox(height: 100), 

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
