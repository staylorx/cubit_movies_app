// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cubit_movies_app/cubit/movies_state.dart';
import 'package:cubit_movies_app/services/movies_repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }
  final MovieRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
