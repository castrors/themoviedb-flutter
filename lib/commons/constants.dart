import 'package:flutter/material.dart';
import 'package:themoviedb/model/genre.dart';

final String imagePrefix = 'https://image.tmdb.org/t/p/w500';

final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w300);

final List<Genre> genres = [
  {"id": 28, "name": "Action"},
  {"id": 12, "name": "Adventure"},
  {"id": 16, "name": "Animation"},
  {"id": 35, "name": "Comedy"},
  {"id": 80, "name": "Crime"},
  {"id": 99, "name": "Documentary"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Family"},
  {"id": 14, "name": "Fantasy"},
  {"id": 36, "name": "History"},
  {"id": 27, "name": "Horror"},
  {"id": 10402, "name": "Music"},
  {"id": 9648, "name": "Mystery"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Science Fiction"},
  {"id": 10770, "name": "TV Movie"},
  {"id": 53, "name": "Thriller"},
  {"id": 10752, "name": "War"},
  {"id": 37, "name": "Western"}
].map((genreMap) => Genre.fromJson(genreMap)).toList();

List<Genre> genresBy(List<int> genreIds) {
  List<Genre> result = [];
  genreIds.forEach((genreId) {
    result.add(genres.firstWhere((genre) => genre.id == genreId));
  });
  return result;
}
