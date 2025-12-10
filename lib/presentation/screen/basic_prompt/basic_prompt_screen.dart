import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/presentation/provider/chat/basic_chat.dart';
import 'package:gemini_app/presentation/provider/chat/is_gemini_writing.dart';

import 'package:gemini_app/presentation/provider/user/user_provider.dart';
import 'package:gemini_app/presentation/widget/chat/custom_bottom_input.dart';
import 'package:image_picker/image_picker.dart';

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
          // final basicChatNotifier = ref.read(basicChatProvider.notifier);
          // basicChatNotifier.addMessage(partialText: partialText, user: user);
        },
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        customBottomWidget: CustomBottomInput(
          onSend: (partialText, {images = const []}) {
            final basicChatNotifier = ref.read(basicChatProvider.notifier);
            basicChatNotifier.addMessage(partialText: partialText, user: user);
            print(images);
          },
        ),
        // onAttachmentPressed: () async {
        //   ImagePicker picker = ImagePicker();
        //   final List<XFile> images = await picker.pickMultiImage(limit: 4);
        //   if (images.isEmpty) return;

        //   print(images);
        // },
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
