import 'package:tvoyo_kino/data/models/movie.dart';
import 'package:tvoyo_kino/presentation/resources/application_images.dart';

class MoviesRepository {
   final Movie primaryMovie = Movie(
      picture: Images.primalMoviePicture,
      namePicture: Images.primalMoviewNamePicture,
      description:
          'Чтобы обрести свободу, киллер-изгой бросает\nвызов Правлению кланов. Самая зрелищная\n часть стильной экшн-саги');

   final List<Movie> newMovies = [
    Movie(name: 'Синий жук', picture: Images.newMovie1),
    Movie(name: 'Домашная игра', picture: Images.newMovie2),
    Movie(name: 'Салют 7', picture: Images.newMovie3),
    Movie(name: 'Поймай меня, если сможешь', picture: Images.newMovie4),
  ];

   final List<Movie> topMovies = [
    Movie(picture: Images.topMovie1, topPicture: Images.topNumber1),
    Movie(picture: Images.topMovie2, topPicture: Images.topNumber2),
    Movie(picture: Images.topMovie3, topPicture: Images.topNumber3),
    Movie(picture: Images.topMovie4, topPicture: Images.topNumber4),
  ];
}
