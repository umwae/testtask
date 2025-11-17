import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/theme/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final themeCubit = context.read<ThemeCubit>();
        return IconButton(
          icon: Icon(
            themeCubit.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: themeCubit.toggleTheme,
        );
      },
    );
  }
}
