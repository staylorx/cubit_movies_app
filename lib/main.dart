// Flutter imports:
import 'package:cubit_movies_app/utilties/constants.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:cubit_movies_app/cubit/movies_cubit.dart';
import 'package:cubit_movies_app/cubit/simple_bloc_observer.dart';
import 'package:cubit_movies_app/pages/movies_page.dart';
import 'package:cubit_movies_app/services/movies_repository.dart';
import 'package:cubit_movies_app/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('main'));

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          repository: MovieRepository(client: Dio()),
        ),
        child: const MoviesPage(),
      ),
    );
  }
}
