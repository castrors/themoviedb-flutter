import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:themoviedb/repository/movies_repository.dart';
import './movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;

  MoviesBloc({@required this.moviesRepository})
      : assert(moviesRepository != null);

  MoviesState get initialState => MoviesUnitialized();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    final currentState = state;
    if (event is Fetch) {
      // yield MoviesLoading();
      try {
        if (currentState is MoviesUnitialized) {
          final movies = await moviesRepository.fetchMovies(1);
          if (movies.isEmpty) {
            yield MoviesEmpty();
          } else {
            yield MoviesFetched(movies: movies, hasReachedMax: false);
          }
          return;
        }
        if (currentState is MoviesFetched) {
          final movies =
              await moviesRepository.fetchMovies(_getNextPage(currentState));
          yield movies.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : MoviesFetched(
                  movies: currentState.movies + movies,
                  hasReachedMax: false,
                );

          // if (movies.isEmpty) {
          //   yield MoviesEmpty();
          // } else {
          //   yield MoviesFetched(movies: movies);
          // }
          return;
        }
      } catch (error) {
        yield MoviesError(error: error.toString());
      }
    }
  }
}

int _getNextPage(MoviesFetched currentState) {
  return currentState.movies.length ~/ 20 + 1;
}
