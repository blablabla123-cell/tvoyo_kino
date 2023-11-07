import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/domain/cubits/main_screen_cubit.dart';
import 'package:tvoyo_kino/presentation/resources/application_theme.dart';
import 'package:tvoyo_kino/presentation/screens/main_screen.dart';

void main() {
  runApp(const _Application());
}

class _Application extends StatelessWidget {
  const _Application();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.theme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => MainScreenCubit(),
        child: const MainScreen(),
      ),
    );
  }
}
