import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_lib/features/library/di/library_providers.dart';
import 'package:vibe_lib/features/library/domain/entities/prompt_entity.dart';

class LibraryViewModel extends AsyncNotifier<List<PromptEntity>> {
  @override
  Future<List<PromptEntity>> build() async {
    final repository = ref.watch(promptRepositoryProvider);
    return repository.getPrompts();
  }
}

final libraryViewModelProvider =
    AsyncNotifierProvider<LibraryViewModel, List<PromptEntity>>(
      LibraryViewModel.new,
    );
