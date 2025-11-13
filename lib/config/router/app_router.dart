import 'package:go_router/go_router.dart';

import 'package:gemini_app/presentation/screen/home/home_screen.dart';
import 'package:gemini_app/presentation/screen/basic_prompt/basic_prompt_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/basic-prompt',
      builder: (context, state) => const BasicPromptScreen(),
    ),
  ],
);
