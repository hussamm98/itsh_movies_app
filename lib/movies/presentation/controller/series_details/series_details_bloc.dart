import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_event.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_state.dart';

import '../../../domain/usecase/get_recommendation_tv_usecase.dart';
import '../../../domain/usecase/get_series_details_usecase.dart';

class SeriesDetailsBloc extends Cubit<SeriesDetailsState> {
  final GetSeriesDetailsUseCase getSeriesDetailsUseCase;
  final GetRecommendationSeriesUseCase getRecommendationSeriesUseCase;

  SeriesDetailsBloc({
    required this.getSeriesDetailsUseCase,
    required this.getRecommendationSeriesUseCase,
  }) : super(const SeriesDetailsState());

  FutureOr<void> getSeriesDetails({required int seriesId}) async {
    final result = await getSeriesDetailsUseCase
        .call(SeriesDetailsParameter(seriesId: seriesId));
    result.fold(
      (l) => emit(
        state.copyWith(
          tvMessage: l.message,
          tvStateDetails: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvStateDetails: RequestState.loaded,
          getTVDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> getRecommendationSeries(
      {required int recommendationId}) async {
    final result = await getRecommendationSeriesUseCase
        .call(RecommendationParameter(id: recommendationId));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationSeriesMessage: l.message,
          recommendationSeriesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationSeriesState: RequestState.loaded,
          recommendationSeriesEntity: r,
        ),
      ),
    );
  }

  initScreen() {
    emit(state.copyWith(
      recommendationSeriesState: RequestState.loading,
      tvStateDetails: RequestState.loading,
    ));
  }
}
