import 'package:testtask/src/data/datasources/database.dart';
import 'package:testtask/src/core/exceptions/app_exception.dart';
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/domain/mappers.dart';
import 'package:testtask/src/data/datasources/api_client.dart';

class CharactersRepository {
  final DB database;
  final ApiClient apiClient;

  CharactersRepository(this.database, this.apiClient);

  Future<void> clearCache() async {
    await database.deleteAllEntries();
  }

  Future<List<CharacterEntity>> getAllCharacters() async {
    final dbCharacters = await database.getAllCharacters();
    return dbCharacters.map((Character ch) => ch.toEntity()).toList();
  }

  Future<void> toggleFavorite(int id) async {
    await database.toggleFavorite(id);
  }

  Stream<List<CharacterEntity>> watchFavorites(
    int Function(CharacterEntity, CharacterEntity)? comparator
  ) => database.watchCharacters().map(
    (characters) =>
        characters.where((element) => element.isFavorite)
        .map((e) => e.toEntity())
        .toList()
        ..sort(comparator ?? (a, b) => 0),
  );

  Future<(List<CharacterEntity>, bool, String? excMsg)> fetchCharacters() async {
    final cache = await getAllCharacters();
    try {
      if (cache.isEmpty) {
        return await _fetchNextPage(currentPage: 0);
      } else {
        final currentPageIdx = await database.getCurrentPageIdx();
        return await _fetchNextPage(currentPage: currentPageIdx);
      }
    } on NetworkException catch (e) {
      return (cache, false, e.message);
    }
  }

  Future<(List<CharacterEntity>, bool, String? excMsg)> _fetchNextPage({
    required int currentPage,
    String? excMsg,
  }) async {
    final nextPage = await _fetchCharPage(page: currentPage + 1);
    await database.insertCharPage(nextPage.toCompanion());
    await database.insertMultipleCharacters(
      nextPage.characters.map((e) => e.toCompanion()).toList(),
    );
    final cache = await getAllCharacters();
    final result = (cache + nextPage.characters, nextPage.isLastPage, excMsg);
    return result;
  }

  Future<CharPageEntity> _fetchCharPage({int page = 1}) async {
    return await apiClient
        .getCharactersPage(page: page)
        .then((value) => value.toEntity(page, apiClient.getImageData));
  }
}
