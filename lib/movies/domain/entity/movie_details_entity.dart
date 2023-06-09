import 'package:equatable/equatable.dart';

import 'gener_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String ?backDropPath;
  final List<GenresEntity> genres;
  final int id;
  final String? imdbId;
  final String? overview;
  final String? releaseDate;
  final int ?runTime;
  final String? title;
  final double? voteAverage;
  final bool ?hasVideo;
  final String ?tagline;
  final String? homePageLink;

  const MovieDetailsEntity({
     this.backDropPath,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
    required this.hasVideo,
    required this.tagline,
    required this.homePageLink,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        genres,
        id,
        imdbId,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
        hasVideo,
        tagline,
        homePageLink,
        genres,
      ];
}
