import 'package:themoviedb/model/movie.dart';

final List<Movie> fakeMoviesEmptyList = [];

final List<Movie> fakeMoviesList = [
  {
    "popularity": 256.12,
    "vote_count": 51,
    "video": false,
    "poster_path": "/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg",
    "id": 330457,
    "adult": false,
    "backdrop_path": "/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg",
    "original_language": "en",
    "original_title": "Frozen II",
    "genre_ids": [12, 16, 35, 14, 10402, 10751],
    "title": "Frozen II",
    "vote_average": 5.6,
    "overview":
        "Elsa, Anna, Kristoff and Olaf are going far in the forest to know the truth about an ancient mystery of their kingdom.",
    "release_date": "2019-11-20"
  },
  {
    "popularity": 56.057,
    "vote_count": 10518,
    "video": false,
    "poster_path": "/eFnGmj63QPUpK7QUWSOUhypIQOT.jpg",
    "id": 109445,
    "adult": false,
    "backdrop_path": "/cN9Nbwh66TRcj2gBE8cSEZulsx3.jpg",
    "original_language": "en",
    "original_title": "Frozen",
    "genre_ids": [12, 16, 10751],
    "title": "Frozen",
    "vote_average": 7.3,
    "overview":
        "Young princess Anna of Arendelle dreams about finding true love at her sister Elsa’s coronation. Fate takes her on a dangerous journey in an attempt to end the eternal winter that has fallen over the kingdom. She's accompanied by ice delivery man Kristoff, his reindeer Sven, and snowman Olaf. On an adventure where she will find out what friendship, courage, family, and true love really means.",
    "release_date": "2013-11-27"
  },
  {
    "popularity": 12.126,
    "vote_count": 1071,
    "video": false,
    "poster_path": "/lfZNJlAZoheNVHPBhTTlpkBQj4B.jpg",
    "id": 44363,
    "adult": false,
    "backdrop_path": "/tLS76JVfBWJ4UICTbKVT60a307O.jpg",
    "original_language": "en",
    "original_title": "Frozen",
    "genre_ids": [53],
    "title": "Frozen",
    "vote_average": 5.8,
    "overview":
        "When three skiers find themselves stranded on a chair lift at a New England ski resort that has closed for the next week, they are forced to make life or death choices that prove to be more perilous than staying put and freezing to death.",
    "release_date": "2010-02-05"
  }
].map((movieJson) => Movie.fromJson(movieJson)).toList();
