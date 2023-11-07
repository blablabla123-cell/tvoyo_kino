import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/data/models/movie.dart';
import 'package:tvoyo_kino/data/repositories/movies_repository.dart';

class MainScreeCubitState extends Equatable {
  final List<Movie> newMovies;
  final List<Movie> topMovies;
  final Movie? primaryMovie;

  const MainScreeCubitState({
    required this.newMovies,
    required this.topMovies,
    this.primaryMovie,
  });

  @override
  List<Object?> get props => [
        newMovies,
        topMovies,
        primaryMovie,
      ];

  MainScreeCubitState copyWith({
    List<Movie>? newMovies,
    List<Movie>? topMovies,
    Movie? primaryMovie,
  }) {
    return MainScreeCubitState(
      newMovies: newMovies ?? this.newMovies,
      topMovies: topMovies ?? this.topMovies,
      primaryMovie: primaryMovie ?? this.primaryMovie,
    );
  }
}

class MainScreenCubit extends Cubit<MainScreeCubitState> {
  MainScreenCubit()
      : super(const MainScreeCubitState(newMovies: [], topMovies: [])) {
    final MoviesRepository moviesRepository = MoviesRepository();

    emit(state.copyWith(
      newMovies: moviesRepository.newMovies,
      primaryMovie: moviesRepository.primaryMovie,
      topMovies: moviesRepository.topMovies,
    ));
  }

  void onLogoTapped() {
    debugPrint('Logo tapped');
  }

  void onNavRailIDestSelected(int value) {
    debugPrint('Nav Rail Dest: $value');
  }

  void onNavRailArrowUpwardTapped() {
    debugPrint('Nav Rail Arrow upward tapped');
  }

  void watchMovieButtonPressed() {
    debugPrint('Watch movie button pressed');
  }

  void aboutMovieButtonPressed() {
    debugPrint('About movie button pressed');
  }

  void newMovieView() {
    debugPrint('View specific new movie');
  }

  void viewTopMovie() {
    debugPrint('View specific top movie');
  }
}
