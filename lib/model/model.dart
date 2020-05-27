class Movie {
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final String genre;
  final String director;
  final String plot;
  final String poster;
  final String imdbRating;
  final String metaScore;

  Movie(
      {this.title,
      this.year,
      this.rating,
      this.runtime,
      this.genre,
      this.director,
      this.plot,
      this.poster,
      this.imdbRating,
      this.metaScore});

  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        rating: json['Rated'],
        runtime: json['Runtime'],
        genre: json['Genre'],
        director: json['Director'],
        plot: json['Plot'],
        poster: json['Poster'],
        imdbRating: json['imdbRating'],
        metaScore: json['Metascore']);
  }
}
