import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/widgets/character_card.dart';
import 'package:testtask/src/core/widgets/rate_limited_snackbar.dart';
import 'package:testtask/src/core/widgets/theme_button.dart';
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/presentation/cubit/characters_state.dart';
import 'package:testtask/src/presentation/cubit/characters_cubit.dart';
import 'package:testtask/src/presentation/cubit/favorites_cubit.dart';
import 'package:testtask/src/presentation/cubit/favorites_state.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await context.read<CharactersCubit>().clearCache();
      await context.read<CharactersCubit>().fetchCharacters();
    });
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<CharactersCubit>().state;
    if (state is ChLoaded &&
        !state.lastPage &&
        _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<CharactersCubit>().fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Персонажи'),
        actions: const [ThemeButton()],
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, favState) {
          final favoriteIds = favState.favorites.map((e) => e.id).toList();

          return BlocConsumer<CharactersCubit, CharactersState>(
            listener: (context, state) {
              if (state is ChFailure || (state is ChLoaded && state.message != null)) {
                RateLimitedSnackbar.show(context, state.message ?? '');
              }
            },
            builder: (context, state) {
              return switch (state) {
                ChInitial() => const Center(child: CircularProgressIndicator()),
                ChLoading(:final characters, :final lastPage) =>
                  characters.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : _characterListView(
                          characters,
                          isLoading: true,
                          lastPage: lastPage,
                          favoriteIds: favoriteIds,
                        ),
                ChLoaded(:final characters, :final lastPage) => _characterListView(
                  characters,
                  isLoading: false,
                  lastPage: lastPage,
                  favoriteIds: favoriteIds,
                ),
                ChFailure(:final characters, :final lastPage) => _characterListView(
                  characters,
                  isLoading: false,
                  lastPage: lastPage,
                  favoriteIds: favoriteIds,
                ),
              };
            },
          );
        },
      ),
    );
  }

  Widget _characterListView(
    List<CharacterEntity> characters, {
    required bool isLoading,
    required List<int> favoriteIds,
    bool lastPage = false,
  }) => ListView.builder(
    controller: _scrollController,
    itemCount: lastPage ? characters.length : characters.length + 1,
    itemBuilder: (context, idx) {
      final ch = idx < characters.length ? characters[idx] : null;
      return CharacterCard(
        ch: ch,
        key: ValueKey(ch?.id),
        onFavoritePressed: () => context.read<FavoritesCubit>().toggleFavorite(ch!.id),
        isFav: favoriteIds.contains(ch?.id),
      );
    },
  );
}

