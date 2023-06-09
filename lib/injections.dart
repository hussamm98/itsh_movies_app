import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/remote_data_source/remote_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository_imp.dart';
import 'package:movies_app/movies/data/repository/series_repository_imp.dart';
import 'package:movies_app/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/series_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_series_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/series_bloc/series_bloc.dart';

import 'movies/data/data_source/base_remote_data_source.dart';
import 'movies/domain/usecase/get_movie_details_usecase.dart';
import 'movies/domain/usecase/get_popular_series_usecase.dart';
import 'movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'movies/domain/usecase/get_recommendation_tv_usecase.dart';
import 'movies/domain/usecase/get_series_details_usecase.dart';
import 'movies/domain/usecase/get_upcoming_usecase.dart';
import 'movies/presentation/controller/series_details/series_details_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    ///DATA Source
    getIt.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    ///Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt()));
    getIt.registerLazySingleton<BaseSeriesRepository>(
        () => SeriesRepository(getIt()));

    ///UseCase
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpComingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedSeriesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularSeriesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetSeriesDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationSeriesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationMoviesUseCase(getIt()));

    ///BLOC
    getIt.registerLazySingleton(() => MoviesBloc(
          getNowPlayingMoviesUseCase: getIt(),
          getPopularMoviesUseCase: getIt(),
          getTopRatedMoviesUseCase: getIt(),
          getUpComingMoviesUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => MovieDetailsBloc(
          getMovieDetailsUseCase: getIt(),
          getRecommendationMoviesUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => SeriesBloc(
          getIt(),
          getIt(),
        ));
    getIt.registerLazySingleton(() => SeriesDetailsBloc(
          getSeriesDetailsUseCase: getIt(),
          getRecommendationSeriesUseCase: getIt(),
        ));
  }
}
