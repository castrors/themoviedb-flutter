import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/repository/movies_repository.dart';

import '../fake/fake_movies.dart';


class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  MoviesBloc moviesBloc;
  MockMoviesRepository moviesRepository;

  setUp(() {
    moviesRepository = MockMoviesRepository();
    moviesBloc = MoviesBloc(moviesRepository: moviesRepository);
  });

  tearDown(() {
    moviesBloc?.close();
  });

  test('initial state is correct', () {
    expect(moviesBloc.initialState, MoviesUnitialized());
  });

  test('close does not emit new states', () {
    expectLater(
      moviesBloc,
      emitsInOrder([MoviesUnitialized(), emitsDone]),
    );
    moviesBloc.close();
  });

  group('Event Fetch', () {
    test(
        'When user perform fetch a filled list should move from unitialized to fetched',
        () {
      //Arrange
      when(moviesRepository.fetchMovies(1))
          .thenAnswer((_) => Future.value(fakeMoviesList));

      //Act
      moviesBloc.add(Fetch());

      //Assert
      final expectedResponse = [
        MoviesUnitialized(),
        MoviesFetched(movies: fakeMoviesList, hasReachedMax: false)
      ];
      expectLater(
        moviesBloc,
        emitsInOrder(expectedResponse),
      );
    });

    test(
        'When user perform fetch a empty list should move from unitialized to empty',
        () {
      //Arrange
      when(moviesRepository.fetchMovies(1))
          .thenAnswer((_) => Future.value(fakeMoviesEmptyList));

      //Act
      moviesBloc.add(Fetch());

      //Assert
      final expectedResponse = [MoviesUnitialized(), MoviesEmpty()];
      expectLater(
        moviesBloc,
        emitsInOrder(expectedResponse),
      );
    });
  });

  group('Event Search', () {
    test(
        'When user perform search with a filled list should move from unitialized to fetched',
        () {
      //Arrange
      when(moviesRepository.searchMovies('query', 1))
          .thenAnswer((_) => Future.value(fakeMoviesList));

      //Act
      moviesBloc.add(Search(query: 'query'));

      //Assert
      final expectedResponse = [
        MoviesUnitialized(),
        MoviesFetched(movies: fakeMoviesList, hasReachedMax: false)
      ];
      expectLater(
        moviesBloc,
        emitsInOrder(expectedResponse),
      );
    });
    test(
        'When user perform search with a empty list should move from unitialized to empty',
        () {
      //Arrange
      when(moviesRepository.searchMovies('query', 1))
          .thenAnswer((_) => Future.value(fakeMoviesEmptyList));

      //Act
      moviesBloc.add(Search(query: 'query'));

      //Assert
      final expectedResponse = [
        MoviesUnitialized(),
        MoviesEmpty()
      ];
      expectLater(
        moviesBloc,
        emitsInOrder(expectedResponse),
      );
    });
  });
}
