import 'package:movies_app/movies/domain/usecase/get_series_details_usecase.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_recommendation_movie_usecase.dart';
import '../model/movie_details_model.dart';
import '../model/movie_model.dart';
import '../model/recommendation_model.dart';
import '../model/series_details_model.dart';
import '../model/series_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getUpComingMovies();

  Future<List<SeriesModel>> getTopRatedSeries();

  Future<List<SeriesModel>> getPopularSeries();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);

  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameter parameter);

  Future<SeriesDetailsModel> getSeriesDetails(SeriesDetailsParameter parameter);
  Future<List<RecommendationModel>> getRecommendationSeries(
      RecommendationParameter parameter);


}