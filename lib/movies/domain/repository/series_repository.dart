import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entity/tv_details_entity.dart';
import 'package:movies_app/movies/domain/entity/tv_entity.dart';

import '../entity/recommendation_entity.dart';
import '../usecase/get_recommendation_movie_usecase.dart';
import '../usecase/get_series_details_usecase.dart';

abstract class BaseSeriesRepository{

  Future<Either<Failure,List<TVEntity>>> getTopRatedSeries();
  Future<Either<Failure,List<TVEntity>>> getPopularSeries();
  Future<Either<Failure,TVDetailsEntity>> getSeriesDetails(SeriesDetailsParameter parameter);
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationSeries(RecommendationParameter parameter);

}