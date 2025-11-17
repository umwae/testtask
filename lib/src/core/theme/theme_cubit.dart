import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ThemeState {
  const ThemeState();
}

class Light extends ThemeState {
  const Light();
}

class Dark extends ThemeState {
  const Dark();
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const Light());

  void toggleTheme() {
    if (state is Light) {
      emit(const Dark());
    } else {
      emit(const Light());
    }
  }

  ThemeMode get themeMode {
    if (state is Light) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  bool get isDarkMode {
    return state is Dark;
  }
}
