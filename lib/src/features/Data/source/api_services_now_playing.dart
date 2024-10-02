import 'dart:convert';
import 'package:cleanarchi/src/common/utils.dart';
import 'package:cleanarchi/src/features/Data/model/up_comming_movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:cleanarchi/src/error/failure.dart';
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<NowPlayingMovieModel> getNowPlayingMovies(int page);
  Future<NowPlayingMovieModel> getUpCommingMovies(int page); // Ensure this signature matches
}

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = key;

  @override
  Future<NowPlayingMovieModel> getNowPlayingMovies(int page) async {
    const endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$apiKey&page=$page';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NowPlayingMovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerFailure(message: 'Failed to load movies: ${response.reasonPhrase}');
    }
  }

  @override
  Future<NowPlayingMovieModel> getUpCommingMovies(int page) async {
    const endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$apiKey&page=$page';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NowPlayingMovieModel.fromJson(jsonDecode(response.body)); // Ensure you're using the correct model
    } else {
      throw ServerFailure(message: 'Failed to load upcoming movies: ${response.reasonPhrase}');
    }
  }
}
