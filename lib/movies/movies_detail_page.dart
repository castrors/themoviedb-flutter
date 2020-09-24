import 'package:flutter/material.dart';
import 'package:themoviedb/commons/constants.dart';
import 'package:themoviedb/commons/date_utils.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/widgets/movie_image.dart';

class MoviesDetailPage extends StatelessWidget {
  const MoviesDetailPage({
    Key key,
    @required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title, style: titleStyle,),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MovieImage(movie),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      movie.overview,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Wrap(
                      children: <Widget>[
                        for (var genre in genresBy(movie.genreIds))
                          Chip(
                            label: Text(genre.name),
                          )
                      ],
                    ),
                    Text(
                      'Release Date: ' +
                          DateUtils.formatDate(
                              movie.releaseDate, 'dd MMMM yyyy'),
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
