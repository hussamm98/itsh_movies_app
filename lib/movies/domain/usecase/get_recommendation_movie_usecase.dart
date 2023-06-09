import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';

import '../repository/movies_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<
    List<RecommendationEntity>, RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(
      RecommendationParameter parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}
