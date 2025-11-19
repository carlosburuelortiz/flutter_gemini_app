import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
geminiUser(Ref ref) {
  final geminiUser = types.User(
    id: 'gemini-id',
    firstName: 'Gemini',
    imageUrl:
        'https://wormholeriders.org/youdecide/wp-content/uploads/2013/04/Agam-Darshi-Twitter.jpg',
  );

  return geminiUser;
}
