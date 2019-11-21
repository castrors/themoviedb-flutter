import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/commons/constants.dart';
import 'package:themoviedb/commons/custom_search_delegate.dart';
import 'package:themoviedb/movies/movies_detail_page.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';
import 'package:themoviedb/widgets/movie_list_item.dart';
import 'package:themoviedb/widgets/movies_bloc_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Movie DB',
          style: titleStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(scrollController: _scrollController),
              );
            },
          )
        ],
      ),
      body: MoviesBlocWidget(scrollController: _scrollController),
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


