import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecocyclo_app/theme/app_colors.dart';
import '../../widgets/login_textfield.dart';
import '../../widgets/cadastro/cadastro_back_button.dart';
import '../../widgets/cadastro/cadastro_next_button.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.gradientLeft,
              AppColors.gradientRight,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 48.0),
                            child: Text(
                              'Credenciais de Acesso',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          LoginTextField(
                            hintText: 'Email',
                            iconPath: 'assets/icons/email.svg',
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Email obrigatório';
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Email inválido';
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          LoginTextField(
                            hintText: 'Senha',
                            iconPath: 'assets/icons/password.svg',
                            obscureText: true,
                            passwordVisible: _passwordVisible,
                            onToggle: () => setState(() => _passwordVisible = !_passwordVisible),
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Senha obrigatória';
                              if (value.length < 6) return 'Senha muito curta';
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          LoginTextField(
                            hintText: 'Confirme a Senha',
                            iconPath: 'assets/icons/password.svg',
                            obscureText: true,
                            passwordVisible: _confirmPasswordVisible,
                            onToggle: () => setState(() => _confirmPasswordVisible = !_confirmPasswordVisible),
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value != _passwordController.text) return 'Senhas não conferem';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CadastroBackButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CadastroNextButton(
                      text: "Cadastrar",
                      isFinal: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            duration: const Duration(seconds: 2),
                            content: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [AppColors.gradientLeft, AppColors.gradientRight],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 26),
                                    blurRadius: 10,
                                    offset: const Offset(0, 9),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, color: Colors.white, size: 28),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'Cadastro realizado com sucesso!',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushReplacementNamed(context, '/login');
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
