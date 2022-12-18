// Package imports:
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:cubit_movies_app/models/movie_model.dart';
import 'package:cubit_movies_app/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('movies_repository'));

class MovieRepository {
  const MovieRepository({required this.client});

  final Dio client;

  Future<List<MovieModel>> getMovies() async {
    try {
      const url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      logger.d('Getting movie info from themoviedb.');
      final response = await client.get(url);

      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
          (json) => MovieModel(
            title: json['title'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          ),
        ),
      );

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
