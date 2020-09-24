import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends MoviesEvent {}

class Search extends MoviesEvent {
  final String query;

  const Search({@required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'Search { query: $query }';
}
