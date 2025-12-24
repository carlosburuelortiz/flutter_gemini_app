import 'package:gemini_app/config/gemini/gemini_impl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gemini_app/presentation/provider/image/generated_history_provider.dart';
import 'package:gemini_app/presentation/provider/image/is_generating_provider.dart';

part 'generated_images_provider.g.dart';

@Riverpod(keepAlive: true)
class GeneratedImages extends _$GeneratedImages {
  final GeminiImpl gemini = GeminiImpl();

  late final IsGenerating isGeneratingNotififer;
  late final GeneratedHistory generatedHistoryNotifier;

  String previousPrompt = '';
  List<XFile> previousImages = [];

  @override
  List<String> build() {
    isGeneratingNotififer = ref.read(isGeneratingProvider.notifier);
    generatedHistoryNotifier = ref.read(generatedHistoryProvider.notifier);

    return [];
  }

  void addImage(String imageUrl) {
    generatedHistoryNotifier.addImage(imageUrl);
    state = [...state, imageUrl];
  }

  void clearImages() {
    state = [];
  }

  Future<void> generateImage(
    String prompt, {
    List<XFile> images = const [],
  }) async {
    isGeneratingNotififer.setIsGenerating();

    final imageUrl = await gemini.generateImage(prompt, files: images);

    if (imageUrl == null) {
      isGeneratingNotififer.setIsNotGenerating();
      return;
    }

    previousPrompt = prompt;
    previousImages = images;

    addImage(imageUrl);
    isGeneratingNotififer.setIsNotGenerating();

    if (state.length == 1) {
      generateImageWithPreviousPrompt();
    }
  }

  Future<void> generateImageWithPreviousPrompt() async {
    if (previousPrompt.isEmpty) return;

    await generateImage(previousPrompt, images: previousImages);
  }
}
