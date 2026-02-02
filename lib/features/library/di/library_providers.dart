import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_lib/features/library/data/datasources/local_prompt_datasource.dart';
import 'package:prompt_lib/features/library/data/repositories/prompt_repository_impl.dart';
import 'package:prompt_lib/features/library/domain/repositories/prompt_repository.dart';

final promptDatasourceProvider = Provider<LocalPromptDatasource>((ref) {
  return LocalPromptDatasource();
});

final promptRepositoryProvider = Provider<PromptRepository>((ref) {
  final datasource = ref.watch(promptDatasourceProvider);
  return PromptRepositoryImpl(datasource);
});
