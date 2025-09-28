// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/informativa_1.dart';
import 'screens/informativa_2.dart';
import 'screens/home.dart';
import 'theme/app_theme.dart';
import 'screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecocyclo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/informativa1',
      routes: {
        '/login': (context) => const LoginPage(),
        '/informativa1': (context) => const Informativa1Screen(),
        '/informativa2': (context) => const Informativa2Screen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}