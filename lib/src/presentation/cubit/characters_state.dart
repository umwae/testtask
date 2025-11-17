import 'package:testtask/src/domain/entities.dart';

sealed class CharactersState {
  const CharactersState();
  List<CharacterEntity> get characters => const [];
  String? get message => null;
  bool get lastPage => false;
}

class ChInitial extends CharactersState {
  const ChInitial();
}

class ChLoading extends CharactersState {
  @override
  final List<CharacterEntity> characters;
  @override
  final bool lastPage;
  const ChLoading(this.characters, {this.lastPage = false});
}

class ChLoaded extends CharactersState {
  @override
  final List<CharacterEntity> characters;
  @override
  final bool lastPage;
  @override
  final String? message;
  const ChLoaded(this.characters, {this.lastPage = false, this.message});
}

class ChFailure extends CharactersState {
  @override
  final List<CharacterEntity> characters;
  @override
  final String message;
  @override
  final bool lastPage;
  const ChFailure(this.message, this.characters, {this.lastPage = false});
}
