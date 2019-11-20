import 'package:themoviedb/model/movie.dart';

class RequestResponse {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  RequestResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  RequestResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = List<Movie>();
      json['results'].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
