import 'package:cleanarchi/src/features/Data/source/api_services_now_playing.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanarchi/src/features/domain/repositories/home_repository.dart';
import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:cleanarchi/src/error/failure.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NowPlayingMovieEntity>> getNowPlayingMovies({required int page}) async {
    try {
      final nowPlayingMovies = await remoteDataSource.getNowPlayingMovies(page);
      return Right(nowPlayingMovies.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString())); // Convert the exception to Failure
    }
  }
}
