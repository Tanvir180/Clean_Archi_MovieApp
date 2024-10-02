
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';
import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/error/failure.dart';

import '../repositories/home_repository.dart';

class GetNowPlayingMoviesUseCase {
  final HomeRepository repository;

  GetNowPlayingMoviesUseCase(this.repository);

  Future<Either<Failure, NowPlayingMovieModel>> execute({required int page}) {
    return repository.getNowPlayingMovies(page: page);
  }
}
