import 'package:google_generative_ai/google_generative_ai.dart';
import '../api_key.dart';

class StoryGenerator {
  Future<String> generateStory() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: Apiclass.apiKey,
      systemInstruction: Content.system(
          'You are story teller. You love generate short horror stories.'),
    );

    final content = [
      Content.text("Write a story"),
    ];
    final response = await model.generateContent(content);

    return response.text?.replaceAll('*', '') ?? "-";
  }
}
