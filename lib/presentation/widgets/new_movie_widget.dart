import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/data/models/movie.dart';
import 'package:tvoyo_kino/domain/cubits/main_screen_cubit.dart';

class NewMovieWidget extends StatelessWidget {
  final Movie movie;

  const NewMovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final MainScreenCubit model = context.read<MainScreenCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Image.asset(movie.picture, height: 597, width: 398),
          onTap: () => model.newMovieView(),
        ),
        Text(
          movie.name!,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
