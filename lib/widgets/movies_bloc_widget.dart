import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/movies/movies_detail_page.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';
import 'package:themoviedb/widgets/movie_list_item.dart';

class MoviesBlocWidget extends StatefulWidget {
  const MoviesBlocWidget({
    Key key,
    MoviesBloc bloc,
  })  : moviesBloc = bloc,
        super(key: key);

  final MoviesBloc moviesBloc;

  @override
  _MoviesBlocWidgetState createState() => _MoviesBlocWidgetState();
}

class _MoviesBlocWidgetState extends State<MoviesBlocWidget> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  MoviesBloc _moviesBloc;

  @override
  void initState() {
    _moviesBloc = widget.moviesBloc;
    _scrollController.addListener(_onScroll);
    super.initState();
  }

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
          return Text(
            'Movies Empty',
            key: Key('empty_state_label'),
          );
        }
        if (state is MoviesError) {
          return Text(
            'Movies Error',
            key: Key('error_state_label'),
          );
        }
        return LoadingIndicator();
      },
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _moviesBloc.add(Fetch());
    }
  }
}
