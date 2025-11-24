import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/presentation/provider/chat/basic_chat.dart';
import 'package:gemini_app/presentation/provider/chat/is_gemini_writing.dart';

import 'package:gemini_app/presentation/provider/user/user_provider.dart';

final messages = <types.Message>[];

class BasicPromptScreen extends ConsumerWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geminiUser = ref.watch(geminiUserProvider);
    final user = ref.watch(userProvider);
    final isGeminiWriting = ref.watch(isGeminiWritingProvider);
    final chatMessage = ref.watch(basicChatProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Prompt Básico')),
      body: Chat(
        messages: chatMessage,

        // On send message
        onSendPressed: (types.PartialText partialText) {
          final basicChatNotifier = ref.read(basicChatProvider.notifier);
          basicChatNotifier.addMessage(partialText: partialText, user: user);
        },
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        // showUserAvatars: true,
        typingIndicatorOptions: TypingIndicatorOptions(
          typingUsers: isGeminiWriting ? [geminiUser] : [],
          customTypingWidget: const Center(
            child: Text('Gemini esta pensando...'),
          ),
        ),
      ),
    );
  }
}
