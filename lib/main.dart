import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/chatbot_screen.dart';
import 'localization/app_localizations.dart';
import 'localization/localization_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'Language Learning',
          debugShowCheckedModeBanner: false,
          locale: provider.locale, // Set language
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('es', ''), // Spanish
            Locale('fr', ''), // French
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routes: {
            '/': (context) => HomeScreen(), // Home Screen
            '/chatbot': (context) => const ChatbotScreen(), // Chatbot Screen
          },
          initialRoute: '/', // Start with HomeScreen
        );
      },
    );
  }
}
