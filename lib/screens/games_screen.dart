import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  String question = "Translate 'Hello' to Spanish:";
  String answer = "";

  void _checkAnswer(String selectedAnswer) {
    setState(() {
      answer = selectedAnswer == "Hola" ? "Correct!" : "Wrong!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Language Games")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/games.png", height: 100), // Game icon
          SizedBox(height: 20),
          Text(question, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _checkAnswer("Hola"),
            child: Text("Hola"),
          ),
          ElevatedButton(
            onPressed: () => _checkAnswer("Bonjour"),
            child: Text("Bonjour"),
          ),
          ElevatedButton(
            onPressed: () => _checkAnswer("Ciao"),
            child: Text("Ciao"),
          ),
          SizedBox(height: 20),
          Text(
            answer,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
