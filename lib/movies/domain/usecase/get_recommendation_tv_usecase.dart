import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';
import 'package:movies_app/movies/domain/repository/series_repository.dart';

import 'get_recommendation_movie_usecase.dart';

class GetRecommendationSeriesUseCase extends BaseUseCase<
    List<RecommendationEntity>, RecommendationParameter> {
  final BaseSeriesRepository baseSeriesRepository;

  GetRecommendationSeriesUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(
      RecommendationParameter parameters) async {
    return await baseSeriesRepository.getRecommendationSeries(parameters);
  }
}


