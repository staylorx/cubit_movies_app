// Flutter imports:
import 'package:cubit_movies_app/models/movie_model.dart';
import 'package:cubit_movies_app/utilties/constants.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cubit_movies_app/cubit/movies_cubit.dart';
import 'package:cubit_movies_app/cubit/movies_state.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;
            return ListViewBuilder(movies: movies);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(movies[index].title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(movies[index].urlImage),
          ),
        ),
      ),
    );
  }
}
