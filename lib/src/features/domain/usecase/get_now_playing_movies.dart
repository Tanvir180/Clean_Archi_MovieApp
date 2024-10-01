
import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/error/failure.dart';

import '../repositories/home_repository.dart';

class GetNowPlayingMoviesUseCase {
  final HomeRepository repository;

  GetNowPlayingMoviesUseCase(this.repository);

  Future<Either<Failure, NowPlayingMovieEntity>> execute({required int page}) {
    return repository.getNowPlayingMovies(page: page);
  }
}
