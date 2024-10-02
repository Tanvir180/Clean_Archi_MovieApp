import 'package:cleanarchi/src/error/failure.dart';
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';
import 'package:cleanarchi/src/features/Data/model/up_comming_movie_model.dart';
import 'package:cleanarchi/src/features/Data/source/api_services_now_playing.dart';
import 'package:cleanarchi/src/features/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NowPlayingMovieModel>> getNowPlayingMovies({required int page}) async {
    try {
      final nowPlayingMovies = await remoteDataSource.getNowPlayingMovies(page);
      return Right(nowPlayingMovies);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NowPlayingMovieModel>> getUpCommingMovies({required int page}) async{
   try{
     final upCommingMovies = await remoteDataSource.getUpCommingMovies(page);
     return Right(upCommingMovies);
   }catch(e)
    {
      return Left(ServerFailure(message: e.toString()));
    }
  }

}
