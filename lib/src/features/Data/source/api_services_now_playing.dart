import 'dart:convert';
import 'package:cleanarchi/src/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:cleanarchi/src/error/failure.dart';
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<NowPlayingMovieModel> getNowPlayingMovies(int page);
}


const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;


class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = key; // Make sure to define `apiKey` properly

  @override
  Future<NowPlayingMovieModel> getNowPlayingMovies(int page) async {
    final endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$apiKey&page=$page';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return NowPlayingMovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerFailure(message: 'Failed to load movies: ${response.reasonPhrase}');
    }
  }
}
