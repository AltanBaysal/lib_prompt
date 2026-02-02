import 'package:prompt_lib/features/library/data/datasources/local_prompt_datasource.dart';
import 'package:prompt_lib/features/library/data/mappers/prompt_mapper.dart';
import 'package:prompt_lib/features/library/domain/entities/prompt_entity.dart';
import 'package:prompt_lib/features/library/domain/repositories/prompt_repository.dart';

class PromptRepositoryImpl implements PromptRepository {
  final LocalPromptDatasource _datasource;

  PromptRepositoryImpl(this._datasource);

  @override
  Future<List<PromptEntity>> getPrompts() async {
    final models = await _datasource.getPrompts();
    return models.map((m) => PromptMapper.toEntity(m)).toList();
  }
}
