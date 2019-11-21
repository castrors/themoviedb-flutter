import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/movies/movies_detail_page.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';
import 'package:themoviedb/widgets/movie_list_item.dart';

class MoviesBlocWidget extends StatelessWidget {
  const MoviesBlocWidget({
    Key key,
    ScrollController scrollController,
    MoviesBloc bloc,
  })  : _scrollController = scrollController,
        _moviesBloc = bloc,
        super(key: key);

  final ScrollController _scrollController;
  final MoviesBloc _moviesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: _moviesBloc,
      builder: (context, state) {
        if (state is MoviesFetched) {
          return GridView.builder(
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return index >= state.movies.length
                  ? BottomLoader()
                  : MovieListItem(
                      movie: movie,
                      onTapFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviesDetailPage(
                              movie: movie,
                            ),
                          ),
                        );
                      },
                    );
            },
            itemCount: state.hasReachedMax
                ? state.movies.length
                : state.movies.length + 1,
            controller: _scrollController,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        }
        if (state is MoviesEmpty) {
          return Text('Movies Empty');
        }
        if (state is MoviesError) {
          return Text('Movies Error');
        }
        return LoadingIndicator();
      },
    );
  }
}
