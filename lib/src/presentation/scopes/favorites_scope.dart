import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/service_locator.dart';
import 'package:testtask/src/presentation/cubit/favorites_cubit.dart';
import 'package:testtask/src/presentation/favorites_screen.dart';

class FavoritesScope extends StatelessWidget {
  const FavoritesScope({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = ServiceLocator.instance.charactersRepository;
    return BlocProvider<FavoritesCubit>(
      create: (_) => FavoritesCubit(repository)..watchFavorites(),
      child: const FavoritesScreen(),
    );
  }
}
