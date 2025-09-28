import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../widgets/settings/settings_header.dart';
import '../../widgets/settings/settings_menu_button.dart';
import '../../widgets/back_button_app.dart';
import '../../theme/app_colors.dart';

final logger = Logger();

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = 229.0;
    final bottomPadding = 20.0;
    final buttonsHeight = 80.0 * 5 + 20.0 * 4 + 40.0; 
    final verticalSpace = (screenHeight - headerHeight - bottomPadding - buttonsHeight) / 2;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SettingsHeader(),
                  SizedBox(height: verticalSpace),

                  // Botões
                  SettingsMenuButton(
                    text: "Minha Conta",
                    svgIconPath: "assets/icons/person.svg",
                  ),
                  const SizedBox(height: 20),
                  SettingsMenuButton(
                    text: "Notificações",
                    svgIconPath: "assets/icons/not.svg",
                  ),
                  const SizedBox(height: 20),
                  SettingsMenuButton(
                    text: "Sobre o Ecocyclo",
                    svgIconPath: "assets/icons/inf.svg",
                  ),
                  const SizedBox(height: 20),
                  SettingsMenuButton(
                    text: "Configurações e privacidade",
                    svgIconPath: "assets/icons/priv.svg",
                  ),
                  const SizedBox(height: 20),
                  SettingsMenuButton(
                    text: "Sair da conta",
                    svgIconPath: null,
                    textGradient: AppColors.logoutGradient,
                  ),

                  SizedBox(height: verticalSpace),
                ],
              ),
            ),

            BackButtonApp(onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
