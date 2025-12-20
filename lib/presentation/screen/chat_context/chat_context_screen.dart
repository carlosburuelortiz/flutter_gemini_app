import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gemini_app/presentation/provider/chat/chat_with_context.dart';
import 'package:gemini_app/presentation/provider/user/user_provider.dart';
import 'package:gemini_app/presentation/widget/chat/custom_bottom_input.dart';

class ChatContextScreen extends ConsumerWidget {
  const ChatContextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final chatMessage = ref.watch(chatWithContextProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat conversacional'),
        actions: [
          IconButton(
            onPressed: () {
              final chatNotifier = ref.read(chatWithContextProvider.notifier);
              chatNotifier.newChat();
            },
            icon: const Icon(Icons.clear_outlined),
          ),
        ],
      ),
      body: Chat(
        messages: chatMessage,

        // On send message
        onSendPressed: (_) {},
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        customBottomWidget: CustomBottomInput(
          onSend: (partialText, {images = const []}) {
            final chatNotifier = ref.read(chatWithContextProvider.notifier);
            chatNotifier.addMessage(
              partialText: partialText,
              user: user,
              images: images,
            );
          },
        ),
      ),
    );
  }
}
