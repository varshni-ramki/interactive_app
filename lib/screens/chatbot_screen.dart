import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  // Predefined AI Responses
  final Map<String, String> aiResponses = {
    "hi": "Hello User",
    "can you help me with my doubt": "Sure I can assist you",
    "hello": "Hi there! How can I assist you?",
    "how are you": "I'm just a chatbot, but I'm here to help!",
    "bye": "Goodbye! Have a great day!",
    "thank you": "You're welcome!",
    "default": "I'm not sure about that, but I'm learning!",
  };

  void _sendMessage() {
    String userMessage = _controller.text.trim().toLowerCase();

    if (userMessage.isNotEmpty) {
      setState(() {
        messages.add({"sender": "user", "message": _controller.text});

        // AI response logic
        String botResponse =
            aiResponses[userMessage] ?? aiResponses["default"]!;
        messages.add({"sender": "bot", "message": botResponse});
      });

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["sender"] == "user";
                return Container(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      messages[index]["message"]!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
