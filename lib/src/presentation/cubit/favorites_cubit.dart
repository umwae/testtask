import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/data/repositories/characters_repository.dart';
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/presentation/cubit/favorites_state.dart';

enum SortingOrder { asc, desc }

class FavoritesCubit extends Cubit<FavoritesState> {
  final CharactersRepository repository;
  StreamSubscription<List<CharacterEntity>>? _subscription;
  SortingOrder order = SortingOrder.asc;

  FavoritesCubit(this.repository) : super(const FavInitial());

  Future<void> toggleFavorite(int id) async {
    await repository.toggleFavorite(id);
  }

  bool isAscending() => order == SortingOrder.asc;

  void watchFavorites([int Function(CharacterEntity, CharacterEntity)? sortingComparator]) {
    _subscription?.cancel();
    _subscription = repository
        .watchFavorites(sortingComparator)
        .listen(
          (list) => emit(FavLoaded(list)),
          onError: (dynamic e) => emit(FavFailure(e.toString(), state.favorites)),
        );
  }

  void toggleSorting() {
    order = order == SortingOrder.asc ? SortingOrder.desc : SortingOrder.asc;
    watchFavorites(
      order == SortingOrder.asc
          ? (a, b) => a.name.compareTo(b.name)
          : (a, b) => b.name.compareTo(a.name),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
