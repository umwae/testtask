import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/data/repositories/characters_repository.dart';
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/data/datasources/api_client.dart';
import 'package:testtask/src/presentation/cubit/characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final ApiClient apiClient;
  final CharactersRepository repository;
  List<CharacterEntity> _allCharacters = [];
  bool _isLastPage = false;

  CharactersCubit(this.apiClient, this.repository) : super(const ChInitial());

  Future<void> fetchCharacters() async {
    if (state is ChLoading) {
      return;
    }
    try {
      emit(ChLoading(_allCharacters, lastPage: _isLastPage));
      final (characters, isLastPage, excMsg) = await repository.fetchCharacters();
      _isLastPage = isLastPage;
      _allCharacters = (_allCharacters + characters).toSet().toList();
      // Некритичные исключения попадают сюда
      emit(ChLoaded(_allCharacters, lastPage: _isLastPage, message: excMsg));
      return;
    } on Exception catch (e) {
      emit(ChFailure(e.toString(), _allCharacters, lastPage: _isLastPage));
    }
  }
}
