import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/commons/constants.dart';
import 'package:themoviedb/commons/custom_search_delegate.dart';
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
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: MoviesBlocWidget(
        bloc: BlocProvider.of<MoviesBloc>(context),
      ),
    );
  }
}
