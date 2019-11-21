import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';
import 'package:themoviedb/widgets/movie_list_item.dart';
import 'movies.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({
    Key key,
  }) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _moviesBloc = BlocProvider.of<MoviesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesFetched) {
          return GridView.builder(
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return index >= state.movies.length
                  ? BottomLoader()
                  : MovieListItem(movie: movie);
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

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _moviesBloc.add(Fetch());
    }
  }
}
