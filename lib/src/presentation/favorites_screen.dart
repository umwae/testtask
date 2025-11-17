import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/widgets/character_card.dart';
import 'package:testtask/src/core/widgets/rate_limited_snackbar.dart';
import 'package:testtask/src/core/widgets/theme_button.dart';
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/presentation/cubit/favorites_state.dart';
import 'package:testtask/src/presentation/cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        actions: [_sortButton(), const ThemeButton()],
      ),
      body: BlocConsumer<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          if (state is FavFailure) {
            RateLimitedSnackbar.show(context, state.message);
          }
        },
        builder: (context, state) {
          switch (state) {
            case FavInitial():
              const Center(child: CircularProgressIndicator());
            case FavLoading(:final favorites):
              return _favoritesListView(favorites);
            case FavLoaded(:final favorites):
              return _favoritesListView(favorites);
            case FavFailure(:final favorites):
              return _favoritesListView(favorites);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _favoritesListView(List<CharacterEntity> favorites) {
    {
      if (favorites.isEmpty) {
        return const Center(child: Text('Нет избранных персонажей'));
      }
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, idx) {
          final character = favorites[idx];
          return CharacterCard(
            ch: character,
            key: ValueKey(character.id),
            isFav: true,
            onFavoritePressed: () => context.read<FavoritesCubit>().toggleFavorite(
              character.id,
            ),
          );
        },
      );
    }
  }
}

Widget _sortButton() {
  return BlocBuilder<FavoritesCubit, FavoritesState>(
    builder: (context, state) {
      final cubit = context.read<FavoritesCubit>();

      return IconButton(
        icon: Transform.flip(
          flipY: !cubit.isAscending(),
          child: const Icon(Icons.sort),
        ),
        onPressed: cubit.toggleSorting,
      );
    },
  );
}
