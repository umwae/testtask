import 'package:testtask/src/domain/entities.dart';

sealed class FavoritesState {
  const FavoritesState();
  List<CharacterEntity> get favorites => const [];
}

class FavInitial extends FavoritesState {
  const FavInitial();
}

class FavLoading extends FavoritesState {
  @override
  final List<CharacterEntity> favorites;
  const FavLoading(this.favorites);
}

class FavLoaded extends FavoritesState {
  @override
  final List<CharacterEntity> favorites;
  const FavLoaded(this.favorites);
}

class FavFailure extends FavoritesState {
  final String message;
  @override
  final List<CharacterEntity> favorites;
  const FavFailure(
    this.message,
    this.favorites,
  );
}
