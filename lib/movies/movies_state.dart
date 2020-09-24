import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:themoviedb/model/movie.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
  @override
  List<Object> get props => [];
}

class MoviesUnitialized extends MoviesState {}

class MoviesEmpty extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesFetched extends MoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;

  const MoviesFetched({
    @required this.movies,
    @required this.hasReachedMax,
  });

  @override
  List<Object> get props => [movies];

  MoviesFetched copyWith({
    List<Movie> movies,
    bool hasReachedMax,
  }) {
    return MoviesFetched(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() => 'Movies { movies: $movies}';
}

class MoviesError extends MoviesState {
  final String error;

  const MoviesError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MoviesError { error: $error }';
}
