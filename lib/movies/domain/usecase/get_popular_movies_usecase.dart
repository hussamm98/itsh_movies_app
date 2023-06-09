import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entity/movie_entity.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>,NoParameters>  {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
