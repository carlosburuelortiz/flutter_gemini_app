import 'package:flutter/material.dart';

class BasicPromptScreen extends StatelessWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BasicPrompt')),
      body: const Center(child: Text('BasicPromptScreen Screen')),
    );
  }
}
