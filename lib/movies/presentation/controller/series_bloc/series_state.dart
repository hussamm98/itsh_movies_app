import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entity/tv_entity.dart';

class SeriesState extends Equatable {
  final List<TVEntity> getTopRatedSeries;
  final RequestState topRatedSeriesState;
  final String topRatedSeriesMessage;
  final List<TVEntity> getPopularSeries;
  final RequestState popularSeriesState;
  final String popularSeriesMessage;


  const SeriesState({
    this.getTopRatedSeries = const [],
    this.topRatedSeriesState = RequestState.loading,
    this.topRatedSeriesMessage = '',
    this.getPopularSeries = const [],
    this.popularSeriesState = RequestState.loading,
    this.popularSeriesMessage = '',

  });

  SeriesState copyWith({
    List<TVEntity>? getTopRatedSeries,
    RequestState? topRatedSeriesState,
    String? topRatedSeriesMessage,
    List<TVEntity>? getPopularSeries,
    RequestState? popularSeriesState,
    String? popularSeriesMessage,

  }) {
    return SeriesState(
      getTopRatedSeries: getTopRatedSeries ?? this.getTopRatedSeries,
      topRatedSeriesState: topRatedSeriesState ?? this.topRatedSeriesState,
      topRatedSeriesMessage:
          topRatedSeriesMessage ?? this.topRatedSeriesMessage,
      getPopularSeries: getPopularSeries ?? this.getPopularSeries,
      popularSeriesState: popularSeriesState ?? this.popularSeriesState,
      popularSeriesMessage: popularSeriesMessage ?? this.popularSeriesMessage,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        getTopRatedSeries,
        topRatedSeriesState,
        topRatedSeriesMessage,
        getPopularSeries,
        popularSeriesState,
        popularSeriesMessage,

      ];
}
