import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';

import '../../../domain/entity/tv_details_entity.dart';

class SeriesDetailsState extends Equatable {
  final TVDetailsEntity? getTVDetails;
  final RequestState tvStateDetailsState;
  final String tvMessage;
  final List<RecommendationEntity> recommendationSeriesEntity;
  final RequestState recommendationSeriesState;
  final String recommendationSeriesMessage;

  const SeriesDetailsState({
    this.getTVDetails,
    this.tvStateDetailsState = RequestState.loading,
    this.tvMessage = '',
    this.recommendationSeriesEntity = const [],
    this.recommendationSeriesState = RequestState.loading,
    this.recommendationSeriesMessage = '',
  });

  SeriesDetailsState copyWith({
    TVDetailsEntity? getTVDetails,
    RequestState? tvStateDetails,
    String? tvMessage,
    List<RecommendationEntity>? recommendationSeriesEntity,
    RequestState? recommendationSeriesState,
    String? recommendationSeriesMessage,
  }) {
    return SeriesDetailsState(
      getTVDetails: getTVDetails ?? this.getTVDetails,
      tvStateDetailsState: tvStateDetails ?? this.tvStateDetailsState,
      tvMessage: tvMessage ?? this.tvMessage,
      recommendationSeriesEntity:
      recommendationSeriesEntity ?? this.recommendationSeriesEntity,
      recommendationSeriesState:
      recommendationSeriesState ?? this.recommendationSeriesState,
      recommendationSeriesMessage:
      recommendationSeriesMessage ?? this.recommendationSeriesMessage,
    );
  }

  @override
  List<Object?> get props => [
    getTVDetails,
    tvStateDetailsState,
    tvMessage,
    recommendationSeriesEntity,
    recommendationSeriesState,
    recommendationSeriesMessage,
      ];
}
