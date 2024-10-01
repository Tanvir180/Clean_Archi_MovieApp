class NowPlayingMovieEntity {
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  NowPlayingMovieEntity({
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class MovieEntity {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });
}

