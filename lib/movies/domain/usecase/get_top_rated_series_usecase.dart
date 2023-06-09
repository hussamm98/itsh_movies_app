import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/tv_entity.dart';
import 'package:movies_app/movies/domain/repository/series_repository.dart';

class GetTopRatedSeriesUseCase
    extends BaseUseCase<List<TVEntity>, NoParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetTopRatedSeriesUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<TVEntity>>> call(
      NoParameters parameters) async {
    return await baseSeriesRepository.getTopRatedSeries();
  }
}
