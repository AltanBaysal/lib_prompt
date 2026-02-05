import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vibe_lib/features/library/data/models/prompt_model.dart';

class LocalPromptDatasource {
  Future<List<PromptModel>> getPrompts() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/json/prompts.json',
      );
      final List<dynamic> data = json.decode(response);

      return data.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return PromptModel(
          id: (index + 1).toString(),
          title: item['title'] as String,
          imageUrl: 'assets/images/${item['photo_name']}',
          prompt: item['prompt'] as String,
          model: 'Stable Diffusion', // Default value as it's not in JSON
        );
      }).toList();
    } catch (e) {
      // Fallback or empty list in case of error
      return [];
    }
  }
}
