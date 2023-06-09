import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entity/recommendation_entity.dart';
import 'package:movies_app/movies/domain/entity/tv_details_entity.dart';
import 'package:movies_app/movies/domain/entity/tv_entity.dart';
import 'package:movies_app/movies/domain/repository/series_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_series_details_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../data_source/base_remote_data_source.dart';

class SeriesRepository extends BaseSeriesRepository{
  final BaseRemoteDataSource remoteDataSource;

  SeriesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TVEntity>>> getTopRatedSeries() async {
    final result = await remoteDataSource.getTopRatedSeries();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  @override
  Future<Either<Failure, List<TVEntity>>> getPopularSeries() async {
    final result = await remoteDataSource.getPopularSeries();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TVDetailsEntity>> getSeriesDetails(SeriesDetailsParameter parameter) async {
    final result = await remoteDataSource.getSeriesDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationSeries(RecommendationParameter parameter) async {
    final result = await remoteDataSource.getRecommendationSeries(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}