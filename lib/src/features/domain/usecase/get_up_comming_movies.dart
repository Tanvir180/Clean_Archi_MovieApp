
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';
import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/error/failure.dart';

import '../../Data/model/up_comming_movie_model.dart';
import '../repositories/home_repository.dart';

class GetUpCommingMoviesUseCase {
  final HomeRepository repository;

  GetUpCommingMoviesUseCase(this.repository);

  Future<Either<Failure, NowPlayingMovieModel>> execute({required int page}) {
    return repository.getUpCommingMovies(page: page);
  }
}
