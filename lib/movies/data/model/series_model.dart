import 'package:movies_app/movies/domain/entity/tv_entity.dart';

class SeriesModel extends TVEntity {
  const SeriesModel({
    required super.id,
    super.backDropPath,
    required super.firstAirDate,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.voteAverage,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        id: json['id'],
        backDropPath:
            json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        firstAirDate: json['first_air_date'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        title: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
