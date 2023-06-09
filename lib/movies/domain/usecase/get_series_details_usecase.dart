import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/series_repository.dart';

import '../entity/tv_details_entity.dart';

class GetSeriesDetailsUseCase
    extends BaseUseCase<TVDetailsEntity, SeriesDetailsParameter> {
  final BaseSeriesRepository baseSeriesRepository;

  GetSeriesDetailsUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, TVDetailsEntity>> call(
      SeriesDetailsParameter parameters) async {
    return await baseSeriesRepository.getSeriesDetails(parameters);
  }
}

class SeriesDetailsParameter extends Equatable {
  final int seriesId;

  const SeriesDetailsParameter({required this.seriesId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        seriesId,
      ];
}
