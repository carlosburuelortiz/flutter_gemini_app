import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gemini_app/presentation/provider/user_provider.dart';

final user = types.User(
  id: 'user-id-abc',
  firstName: 'Carlos',
  lastName: 'Buruel',
  imageUrl:
      'https://wormholeriders.org/youdecide/wp-content/uploads/2013/04/Agam-Darshi-Twitter.jpg',
  //
);

final messages = <types.Message>[];

class BasicPromptScreen extends ConsumerWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final geminiUser = ref.watch(geminiUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Prompt Básico')),
      body: Chat(
        messages: messages,
        onSendPressed: (types.PartialText partialText) {
          print('mensaje: ${partialText.text}');
        },
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        // showUserAvatars: true,
        typingIndicatorOptions: TypingIndicatorOptions(
          // typingUsers: [geminiUser],
          customTypingWidget: const Center(
            child: Text('Gemini esta pensando...'),
          ),
        ),
      ),
    );
  }
}
