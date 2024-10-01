import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/error/failure.dart';


abstract class HomeRepository {
  Future<Either<Failure, NowPlayingMovieEntity>> getNowPlayingMovies({required int page});
}
