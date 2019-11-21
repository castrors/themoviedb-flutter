import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/widgets/movies_bloc_widget.dart';

class CustomSearchDelegate extends SearchDelegate<Movie> {
  CustomSearchDelegate({
    this.scrollController,
  });

  final ScrollController scrollController;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    var moviesRepository =
        BlocProvider.of<MoviesBloc>(context).moviesRepository;
  
    return MoviesBlocWidget(
      scrollController: scrollController,
      bloc: MoviesBloc(moviesRepository: moviesRepository)..add(Search(query: query)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
