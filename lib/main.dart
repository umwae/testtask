import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/service_locator.dart';
import 'package:testtask/src/core/theme/theme_cubit.dart';
import 'package:testtask/src/core/theme/theme_scope.dart';
import 'package:testtask/src/presentation/root_scope.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    ServiceLocator.instance.setup();
    runApp(const MyApp());
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeScope(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp(
            title: 'Rick and Morty',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            themeMode: themeCubit.themeMode,
            home: const RootScope(),
          );
        },
      ),
    );
  }
}
