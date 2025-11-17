import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/service_locator.dart';
import 'package:testtask/src/presentation/characters_screen.dart';
import 'package:testtask/src/presentation/cubit/favorites_cubit.dart';
import 'package:testtask/src/data/datasources/api_client.dart';
import 'package:testtask/src/presentation/cubit/characters_cubit.dart';

class CharactersScope extends StatelessWidget {
  const CharactersScope({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = ServiceLocator.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersCubit>(
          create: (_) => CharactersCubit(ApiClient(), sl.charactersRepository),
        ),
        BlocProvider<FavoritesCubit>(
          create: (_) => FavoritesCubit(sl.charactersRepository)..watchFavorites(),
        ),
      ],
      child: const CharactersScreen(),
    );
  }
}
