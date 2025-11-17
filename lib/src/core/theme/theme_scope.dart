import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/src/core/theme/theme_cubit.dart';

class ThemeScope extends StatelessWidget {
  final Widget child;

  const ThemeScope({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: child,
    );
  }
}
