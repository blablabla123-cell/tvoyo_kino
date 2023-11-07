import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/data/models/movie.dart';
import 'package:tvoyo_kino/domain/cubits/main_screen_cubit.dart';

class TopMovieWidget extends StatelessWidget {
  const TopMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _TopMovieRateWidget(),
        _TopMovieWidget(),
      ],
    );
  }
}

class _TopMovieWidget extends StatelessWidget {
  const _TopMovieWidget();

  @override
  Widget build(BuildContext context) {
    final MainScreenCubit model = context.read<MainScreenCubit>();

    final List<Movie> movies =
        context.select((MainScreenCubit value) => value.state.topMovies);

    return Row(
      children: [
        for (Movie movie in movies) ...[
          const SizedBox(width: 161),
          InkWell(
            onTap: () => model.viewTopMovie(),
            child: Image.asset(movie.picture, width: 398, height: 597),
          ),
          const SizedBox(width: 100),
        ],
      ],
    );
  }
}

class _TopMovieRateWidget extends StatelessWidget {
  const _TopMovieRateWidget();

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies =
        context.select((MainScreenCubit value) => value.state.topMovies);

    return Row(
      children: [
        for (Movie movie in movies) ...[
          Image.asset(movie.topPicture!, height: 392, width: 241),
          const SizedBox(width: 418),
        ]
      ],
    );
  }
}
