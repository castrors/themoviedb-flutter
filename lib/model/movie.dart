class Movie {
  String posterPath;
  int id;
  List<int> genreIds;
  String title;
  String overview;
  String releaseDate;

  Movie(
      {this.posterPath,
      this.id,
      this.genreIds,
      this.title,
      this.overview,
      this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }

  @override
  String toString() {
    
    return title;
  }
}
