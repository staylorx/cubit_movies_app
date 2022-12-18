// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:cubit_movies_app/utilties/log_printer.dart';

final logger = Logger(
  printer: MyLogfmtPrinter('simple_bloc_observer'),
);

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('${bloc.runtimeType} $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('${bloc.runtimeType} $change');
  }
}
