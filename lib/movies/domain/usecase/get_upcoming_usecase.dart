import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/movies_repository.dart';

class GetUpComingMoviesUseCase extends BaseUseCase<List<MovieEntity>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetUpComingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters) async {
  return await baseMoviesRepository.getUpComingMovies();
  }
}