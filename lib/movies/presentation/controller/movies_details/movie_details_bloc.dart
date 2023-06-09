import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';

import '../../../domain/usecase/get_movie_details_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommendationMoviesUseCase,
  }) : super(const MovieDetailsState());

  FutureOr<void> getMovieDetails({required int movieId}) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameter(movieId: movieId),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetailsEntity: r,
        ),
      ),
    );
  }

  FutureOr<void> getRecommendationMovies(
      {required int recommendationId}) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationParameter(id: recommendationId));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationMovieMessage: l.message,
          recommendationMovieState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationMovieEntity: r,
          recommendationMovieState: RequestState.loaded,
        ),
      ),
    );
  }

  initScreen() {
    emit(state.copyWith(
      recommendationMovieState: RequestState.loading,
      movieDetailsState: RequestState.loading,
    ));
  }
}
