import 'package:equatable/equatable.dart';

import 'gener_entity.dart';
import 'networks_entity.dart';

class TVDetailsEntity extends Equatable {
  final String? backDropPath;
  final List<GenresEntity>? genres;
  final int ?id;
  final String ?firstAirDate;
  final String? homePageLink;
  final String? title;
  final List<NetworksEntity> ?networks;
  final int ?numberOfEpisodes;
  final int ?numberOfSeasons;
  final double ?voteAverage;
  final String? overview;

  const TVDetailsEntity({
    required this.backDropPath,
    required this.genres,
    required this.id,
    required this.firstAirDate,
    required this.homePageLink,
    required this.title,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.voteAverage,
    required this.overview,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backDropPath,
        genres,
        id,
        firstAirDate,
        homePageLink,
        title,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        voteAverage,
    overview,
      ];
}
