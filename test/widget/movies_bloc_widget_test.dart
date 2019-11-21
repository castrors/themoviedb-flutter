import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themoviedb/movies/movies_bloc.dart';
import 'package:themoviedb/movies/movies_event.dart';
import 'package:themoviedb/movies/movies_state.dart';

import '../../lib/widgets/movies_bloc_widget.dart';
import '../fake/fake_movies.dart';

class MockMoviesBloc extends MockBloc<MoviesEvent, MoviesState>
    implements MoviesBloc {}

void main() {
  group('Movies Bloc Widget', () {
    MoviesBloc moviesBloc;
    setUp(() {
      moviesBloc = MockMoviesBloc();
    });

    tearDownAll(() {
      moviesBloc.close();
    });

    testWidgets(
        'When open widget fetch is successful with valid list then show items',
        (WidgetTester tester) async {
      when(moviesBloc.state).thenAnswer(
          (_) => MoviesFetched(movies: fakeMoviesList, hasReachedMax: false));
      await tester.pumpWidget(
        MaterialApp(
          home: MoviesBlocWidget(
            bloc: moviesBloc,
          ),
        ),
      );

      expect(find.byKey(Key('${fakeMoviesList.first.id}')), findsOneWidget);
    });
    testWidgets(
        'When open widget fetch is successful with empty list then show empty state',
        (WidgetTester tester) async {
      when(moviesBloc.state).thenAnswer((_) => MoviesEmpty());
      await tester.pumpWidget(
        MaterialApp(
          home: MoviesBlocWidget(
            bloc: moviesBloc,
          ),
        ),
      );

      expect(find.byKey(Key('empty_state_label')), findsOneWidget);
    });

    testWidgets(
        'When open widget fetch is successful with error then show error state',
        (WidgetTester tester) async {
      when(moviesBloc.state).thenAnswer((_) => MoviesError(error: 'Error'));
      await tester.pumpWidget(
        MaterialApp(
          home: MoviesBlocWidget(
            bloc: moviesBloc,
          ),
        ),
      );

      expect(find.byKey(Key('error_state_label')), findsOneWidget);
    });
  });
}
