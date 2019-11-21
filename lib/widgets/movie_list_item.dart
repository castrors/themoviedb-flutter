import 'package:flutter/material.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/widgets/movie_image.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key key,
    @required this.movie,
    @required this.onTapFunction,
  }) : super(key: key);

  
  final Movie movie;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Stack(fit: StackFit.expand, children: <Widget>[
        MovieImage(movie),
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
      ]),
    );
  }
}
