import 'package:equatable/equatable.dart';

class TVEntity extends Equatable {
  final int id;
  final String? backDropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final String title;
  final String overview;
  final double voteAverage;

  const TVEntity({
    required this.id,
     this.backDropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        backDropPath,
        firstAirDate,
        genreIds,
        title,
        overview,
        voteAverage,
      ];
}
