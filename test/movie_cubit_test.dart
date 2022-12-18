// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:cubit_movies_app/cubit/movies_cubit.dart';
import 'package:cubit_movies_app/cubit/movies_state.dart';
import 'package:cubit_movies_app/models/movie_model.dart';
import 'package:cubit_movies_app/services/movies_repository.dart';

class MockRepository extends Mock implements MovieRepository {}

void main() {
  late MockRepository movieRepository;
  late MoviesCubit moviesCubit;

  final movies = [
    const MovieModel(title: 'title 01', urlImage: 'url 01'),
    const MovieModel(title: 'title 02', urlImage: 'url 02'),
  ];

  setUp(() {
    movieRepository = MockRepository();
    when(() => movieRepository.getMovies()).thenAnswer(
      (_) async => movies,
    );
  });

  test('Emits movies when repository answer correctly', () async {
    moviesCubit = MoviesCubit(repository: movieRepository);

    await expectLater(
      moviesCubit.stream,
      emits(
        LoadedState(movies),
      ),
    );
  });
}
