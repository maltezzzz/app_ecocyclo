import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'location_screen.dart';
import 'package:ecocyclo_app/theme/app_colors.dart';
import '../../widgets/login_textfield.dart';
import '../../widgets/cadastro/cadastro_back_button.dart';
import '../../widgets/cadastro/cadastro_next_button.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _registrationController.dispose();
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
                              'Empresa',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),
                          LoginTextField(
                            hintText: 'Nome da Empresa',
                            iconPath: 'assets/icons/company.svg',
                            controller: _companyNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Nome obrigatório';
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          LoginTextField(
                            hintText: 'CNPJ (00.000.000/0000-00)',
                            iconPath: 'assets/icons/registration.svg',
                            controller: _registrationController,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'CNPJ obrigatório';
                              final cnpjRegex = RegExp(r'^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$');
                              if (!cnpjRegex.hasMatch(value)) return 'CNPJ inválido';
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
                      onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
                    ),
                    CadastroNextButton(
                      text: "Próximo",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LocationScreen(),
                            ),
                          );
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
