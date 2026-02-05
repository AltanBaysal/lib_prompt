import 'package:vibe_lib/features/library/data/models/prompt_model.dart';
import 'package:vibe_lib/features/library/domain/entities/prompt_entity.dart';

class PromptMapper {
  static PromptEntity toEntity(PromptModel model) {
    return PromptEntity(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      prompt: model.prompt,
      model: model.model,
    );
  }
}
