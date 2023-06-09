import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_upcoming_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_state.dart';

class MoviesBloc extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;

  MoviesBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getUpComingMoviesUseCase,
  }) : super(const MoviesState());

  FutureOr<void> getTopRatedMovies() async {
    final result = await getTopRatedMoviesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            topRatedMessage: l.message, topRatedState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          getTopRatedMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> getPopularMovies() async {
    final result = await getPopularMoviesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            popularMessage: l.message, popularState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          getPopularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> getNowPlayingMovies() async {
    final result = await getNowPlayingMoviesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            nowPlayingMessage: l.message, nowPlayingState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          getNowPlayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> getUpComingMovies() async {
    final result = await getUpComingMoviesUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            upComingMessage: l.message, upComingState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          upComingState: RequestState.loaded,
          getUpComingMovies: r,
        ),
      ),
    );
  }

}
