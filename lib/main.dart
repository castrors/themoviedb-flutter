import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/movies/movies_page.dart';
import 'package:themoviedb/repository/repository.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final moviesRepository = MoviesRepository(moviesApiClient: MoviesApiClient());
  runApp(
    BlocProvider<MoviesBloc>(
      builder: (context) {
        return MoviesBloc(moviesRepository: moviesRepository)..add(Fetch());
      },
      child: App(moviesRepository: moviesRepository),
    ),
  );
}

class App extends StatelessWidget {
  final MoviesRepository moviesRepository;

  App({Key key, @required this.moviesRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Movie DB'),
        ),
        body: MoviesPage(),
      ),
    );
  }
}
