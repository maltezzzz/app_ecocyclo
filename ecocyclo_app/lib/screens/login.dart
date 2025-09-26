import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/login_textfield.dart';
import '../widgets/login_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const List<Color> _gradientColors = [
    AppColors.gradientLeft,
    AppColors.gradientRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: _gradientColors,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40.0), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                 ClipOval(
                  child: Container(
                    color: const Color(0xFFE0E0E0), 
                    padding: const EdgeInsets.all(0), 
                    child: Image.asset(
                      'assets/Logo.png',
                      height: 150, 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Texto "Ecocyclo"
                Text(
                  'Ecocyclo',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Texto "Bem Vindo"
                Text(
                  'Bem Vindo',
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Campos de texto (E-mail)
                LoginTextField(
                  hintText: 'E-mail',
                  iconPath: 'assets/icons/person.svg',
                  width: 350,
                ),
                const SizedBox(height: 20),
                
                // Campos de texto (Senha)
                LoginTextField(
                  hintText: 'Senha',
                  iconPath: 'assets/icons/password.svg',
                  obscureText: true,
                  width: 350,
                ),
                const SizedBox(height: 30),

                // Botão "Logar"
                LoginButton(
                  text: 'Logar', 
                  onPressed: () {},
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  width: 350,
                  // Aplica o gradiente
                  gradientColors: _gradientColors,
                ),

                const SizedBox(height: 15),

                // Texto "Esqueceu a senha?"
                TextButton(
                  onPressed: () {},
                  child: Text(
                  'Esqueceu a senha?',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                // Texto "Não tem uma conta?"
                Text(
                  'Não tem uma conta?',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 15),

                // Botão "Criar"
                LoginButton(
                  text: 'Criar',
                  onPressed: () {},
                  outlined: true,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  width: 150,
                  // Aplica o gradiente
                  gradientColors: _gradientColors,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}