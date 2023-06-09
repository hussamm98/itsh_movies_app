import 'package:movies_app/movies/domain/entity/tv_details_entity.dart';

import 'genre_model.dart';
import 'networks_model.dart';

class SeriesDetailsModel extends TVDetailsEntity {
  const SeriesDetailsModel({
    required super.backDropPath,
    required super.genres,
    required super.id,
    required super.firstAirDate,
    required super.homePageLink,
    required super.title,
    required super.networks,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.voteAverage,
    required super.overview,
  });

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeriesDetailsModel(
        backDropPath:
        json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        genres: List.from(json['genres'].map((x) => GenreModel.fromJson(x))),
        id: json['id'],
        firstAirDate: json['first_air_date'],
        homePageLink: json['homepage'],
        title: json['name'],
        networks: List.from(json['networks'].map((x) => NetworksModel.fromJson(x))),
        numberOfEpisodes: json['last_episode_to_air']['episode_number'],
        numberOfSeasons: json['last_episode_to_air']['season_number'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
      );
}
