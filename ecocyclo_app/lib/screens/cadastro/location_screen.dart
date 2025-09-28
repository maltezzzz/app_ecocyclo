import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'credentials_screen.dart';
import 'package:ecocyclo_app/theme/app_colors.dart';
import '../../widgets/login_textfield.dart';
import '../../widgets/cadastro/cadastro_back_button.dart';
import '../../widgets/cadastro/cadastro_next_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  @override
  void dispose() {
    _zipCodeController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _referenceController.dispose();
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
                              'Localização',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          LoginTextField(
                            hintText: 'CEP (00000-000)',
                            iconPath: 'assets/icons/zip.svg',
                            controller: _zipCodeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'CEP obrigatório';
                              if (!RegExp(r'^\d{5}-\d{3}$').hasMatch(value)) return 'CEP inválido';
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          LoginTextField(
                            hintText: 'Estado',
                            iconPath: 'assets/icons/state.svg',
                            controller: _stateController,
                            validator: (value) => value == null || value.isEmpty ? 'Estado obrigatório' : null,
                          ),
                          const SizedBox(height: 24),
                          LoginTextField(
                            hintText: 'Cidade',
                            iconPath: 'assets/icons/city.svg',
                            controller: _cityController,
                            validator: (value) => value == null || value.isEmpty ? 'Cidade obrigatória' : null,
                          ),
                          const SizedBox(height: 24),
                          LoginTextField(
                            hintText: 'Endereço (Rua, Número, Bairro)',
                            iconPath: 'assets/icons/address.svg',
                            controller: _addressController,
                            validator: (value) => value == null || value.isEmpty ? 'Endereço obrigatório' : null,
                          ),
                          const SizedBox(height: 24),
                          LoginTextField(
                            hintText: 'Complemento',
                            iconPath: 'assets/icons/reference.svg',
                            controller: _referenceController,
                            validator: (value) => null, // opcional
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
                      text: 'Próximo',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CredentialsScreen(),
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
