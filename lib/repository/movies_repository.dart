import 'package:meta/meta.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/repository/movies_api_client.dart';

class MoviesRepository {
  final MoviesApiClient moviesApiClient;

  MoviesRepository({@required this.moviesApiClient})
      : assert(moviesApiClient != null);

  Future<List<Movie>> fetchMovies(int page) async {
    return await moviesApiClient.fetchMovies(page);
  }
}
