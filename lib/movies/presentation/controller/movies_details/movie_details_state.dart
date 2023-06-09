import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<RecommendationEntity> recommendationMovieEntity;
  final RequestState recommendationMovieState;
  final String recommendationMovieMessage;

  const MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationMovieEntity = const [],
    this.recommendationMovieState = RequestState.loading,
    this.recommendationMovieMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendationEntity>? recommendationMovieEntity,
    RequestState? recommendationMovieState,
    String? recommendationMovieMessage,
  }) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationMovieEntity:
          recommendationMovieEntity ?? this.recommendationMovieEntity,
      recommendationMovieState:
          recommendationMovieState ?? this.recommendationMovieState,
      recommendationMovieMessage:
          recommendationMovieMessage ?? this.recommendationMovieMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsEntity,
        movieDetailsState,
        movieDetailsMessage,
        recommendationMovieEntity,
        recommendationMovieState,
        recommendationMovieMessage,
      ];
}
