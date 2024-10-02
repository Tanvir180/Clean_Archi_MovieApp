import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';
import 'package:cleanarchi/src/features/Data/model/up_comming_movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, NowPlayingMovieModel>> getNowPlayingMovies({required int page});

  Future<Either<Failure, NowPlayingMovieModel>> getUpCommingMovies({required int page});
}