import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../localization/app_localizations.dart';
import '../localization/localization_provider.dart';
import 'chatbot_screen.dart';
import 'games_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localization!.translate("title"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png", height: 150),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Image.asset("assets/chatbot.png", height: 30),
            label: Text(localization.translate("chatbot")),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatbotScreen()),
                ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Image.asset("assets/games.png", height: 30),
            label: Text(localization.translate("games")),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamesScreen()),
                ),
          ),
          SizedBox(height: 20),
          _buildLanguageSwitcher(context),
        ],
      ),
    );
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    return DropdownButton<String>(
      value: Provider.of<LocalizationProvider>(context).locale.languageCode,
      onChanged: (String? newLanguage) {
        if (newLanguage != null) {
          Provider.of<LocalizationProvider>(
            context,
            listen: false,
          ).changeLocale(newLanguage);
        }
      },
      items: [
        DropdownMenuItem(value: "en", child: Text("English")),
        DropdownMenuItem(value: "es", child: Text("Español")),
        DropdownMenuItem(value: "fr", child: Text("Français")),
      ],
    );
  }
}
