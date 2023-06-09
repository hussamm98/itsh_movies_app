import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/series_bloc/series_state.dart';
import '../../../domain/usecase/get_popular_series_usecase.dart';
import '../../../domain/usecase/get_top_rated_series_usecase.dart';

class SeriesBloc extends Cubit<SeriesState> {
  final GetTopRatedSeriesUseCase getTopRatedSeriesUseCase;
  final GetPopularSeriesUseCase getPopularSeriesUseCase;


  SeriesBloc(this.getTopRatedSeriesUseCase,this.getPopularSeriesUseCase,)
      : super(const SeriesState());

  FutureOr<void> getTopRatedSeries() async {
    final result = await getTopRatedSeriesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            topRatedSeriesMessage: l.message, topRatedSeriesState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          topRatedSeriesState: RequestState.loaded,
          getTopRatedSeries: r,
        ),
      ),
    );
  }
  FutureOr<void> getPopularSeries() async {
    final result = await getPopularSeriesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            popularSeriesMessage: l.message, popularSeriesState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          popularSeriesState: RequestState.loaded,
          getPopularSeries: r,
        ),
      ),
    );
  }

}
