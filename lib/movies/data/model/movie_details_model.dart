import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';

import 'genre_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    super.backDropPath,
    required super.genres,
    required super.id,
    required super.imdbId,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
    required super.hasVideo,
    required super.tagline,
    required super.homePageLink,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backDropPath:
            json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        genres: List.from(json['genres'].map((x) => GenreModel.fromJson(x))),
        id: json['id'],
        imdbId:json['imdb_id']==null?null: json['imdb_id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        hasVideo: json['video'],
        tagline: json['tagline'],
        homePageLink: json['homepage'],
      );
}
