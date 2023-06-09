import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';

import '../../../core/error/failure.dart';
import '../entity/movie_details_entity.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, List<MovieEntity>>> getUpComingMovies();

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParameter parameter);

  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationMovies(RecommendationParameter parameter);

}
