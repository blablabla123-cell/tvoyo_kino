import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/data/models/movie.dart';
import 'package:tvoyo_kino/domain/cubits/main_screen_cubit.dart';
import 'package:tvoyo_kino/presentation/resources/application_colors.dart';
import 'package:tvoyo_kino/presentation/resources/application_images.dart';
import 'package:tvoyo_kino/presentation/resources/application_strings.dart';
import 'package:tvoyo_kino/presentation/widgets/gradient_elevated_button_widget.dart';
import 'package:tvoyo_kino/presentation/widgets/nav_rail_widget.dart';
import 'package:tvoyo_kino/presentation/widgets/new_movie_widget.dart';
import 'package:tvoyo_kino/presentation/widgets/top_movie_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: NavRailWidget(),
      body: Row(
        children: [
          NavRailWidget(),
          _MainContent(),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _HeaderWidget(),
            SizedBox(height: 218),
            _NewMoviesWidget(),
            SizedBox(height: 114),
            _TopTenMoviesWidget(),
            SizedBox(height: 354),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    final Movie? primaryMovie =
        context.select((MainScreenCubit value) => value.state.primaryMovie);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -180,
            child: primaryMovie == null
                ? const SizedBox.shrink()
                : Image.asset(primaryMovie.picture),
          ),
          const _PrimaryMovieDetailesWidget(),
        ],
      ),
    );
  }
}

class _PrimaryMovieDetailesWidget extends StatelessWidget {
  const _PrimaryMovieDetailesWidget();

  @override
  Widget build(BuildContext context) {
    final Movie? primaryMovie =
        context.select((MainScreenCubit value) => value.state.primaryMovie);

    return primaryMovie == null
        ? const SizedBox.shrink()
        : Column(
            children: [
              const SizedBox(height: 120),
              Image.asset(primaryMovie.namePicture!),
              const SizedBox(height: 36),
              Text(
                primaryMovie.description!,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              const _PrimaryMovieButtonsWidget(),
            ],
          );
  }
}

class _PrimaryMovieButtonsWidget extends StatelessWidget {
  const _PrimaryMovieButtonsWidget();

  @override
  Widget build(BuildContext context) {
    final MainScreenCubit model = context.read<MainScreenCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientElevatedButtonWidget(
          gradient: ApplicationColors.accentGradient,
          data: Strings.buttonWatchText,
          onTap: () => model.watchMovieButtonPressed(),
        ),
        const SizedBox(width: 24),
        GradientElevatedButtonWidget(
          data: Strings.buttonAboutMovieText,
          onTap: () => model.aboutMovieButtonPressed(),
          gradient: ApplicationColors.transparentGradient,
        ),
      ],
    );
  }
}

class _NewMoviesWidget extends StatelessWidget {
  const _NewMoviesWidget();

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies =
        context.select((MainScreenCubit value) => value.state.newMovies);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Strings.titleNews,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              for (Movie movie in movies) ...[
                NewMovieWidget(movie: movie),
                const SizedBox(width: 44),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class _TopTenMoviesWidget extends StatelessWidget {
  const _TopTenMoviesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset(Images.top10),
            const SizedBox(width: 20),
            const Text(
              Strings.titleWeekViews,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TopMovieWidget(),
        ),
      ],
    );
  }
}
