import 'package:vibe_lib/features/library/domain/entities/prompt_entity.dart';

abstract class PromptRepository {
  Future<List<PromptEntity>> getPrompts();
}
