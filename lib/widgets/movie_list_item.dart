import 'package:flutter/material.dart';
import 'package:themoviedb/model/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final String imagePrefix = 'https://image.tmdb.org/t/p/w500';
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      movie.posterPath == null
          ? Icon(
              Icons.movie,
              size: 48,
            )
          : Image.network(
              imagePrefix + movie.posterPath,
              fit: BoxFit.fitWidth,
            ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 15.0,
                  color: Colors.black,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
