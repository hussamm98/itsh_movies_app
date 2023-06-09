import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../../domain/entity/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> getNowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieEntity> getPopularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<MovieEntity> getTopRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  final List<MovieEntity> getUpComingMovies;
  final RequestState upComingState;
  final String upComingMessage;

  const MoviesState({
    this.getNowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.getPopularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.getTopRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.getUpComingMovies = const [],
    this.upComingState = RequestState.loading,
    this.upComingMessage = '',

  });

  MoviesState copyWith({
    List<MovieEntity>? getNowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<MovieEntity>? getPopularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<MovieEntity>? getTopRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<MovieEntity>? getUpComingMovies,
    RequestState? upComingState,
    String? upComingMessage,

  }) {
    return MoviesState(
      getNowPlayingMovies: getNowPlayingMovies ?? this.getPopularMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      getUpComingMovies: getUpComingMovies ?? this.getUpComingMovies,
      upComingState: upComingState ?? this.upComingState,
      upComingMessage: upComingMessage ?? this.upComingMessage,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        getNowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        getPopularMovies,
        popularState,
        popularMessage,
        getTopRatedMovies,
        topRatedState,
        topRatedMessage,
        getUpComingMovies,
        upComingState,
        upComingMessage,

      ];
}
