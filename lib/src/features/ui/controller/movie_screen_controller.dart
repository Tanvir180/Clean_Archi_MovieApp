import 'package:cleanarchi/src/features/domain/usecase/get_now_playing_movies.dart';
import 'package:cleanarchi/src/features/domain/usecase/get_up_comming_movies.dart';
import 'package:get/get.dart';
import 'package:cleanarchi/src/features/Data/model/now_paying_movie_model.dart';

class MovieScreenController extends GetxController {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetUpCommingMoviesUseCase getUpCommingMoviesUseCase;

  var nowPlayingMovies = <Results>[].obs; // Adjusted type to Results
  var upcomingMovies = <Results>[].obs; // New variable for upcoming movies
  var isLoading = false.obs;
  var currentPage = 1.obs;

  MovieScreenController(this.getNowPlayingMoviesUseCase, this.getUpCommingMoviesUseCase); // Update constructor

  @override
  void onInit() {
    super.onInit();
    fetchNowPlayingMovies();
    fetchUpCommingMovies();
  }

  Future<void> fetchNowPlayingMovies() async {
    isLoading(true);
    final result = await getNowPlayingMoviesUseCase.execute(page: currentPage.value);
    result.fold(
          (failure) {
        isLoading(false);
        print('Failed to fetch movies');
        Get.snackbar('Error', 'Failed to fetch movies'); // Show error in UI
      },
          (movies) {
        nowPlayingMovies.assignAll(movies.results ?? []); // Access results directly from model
        isLoading(false);
      },
    );
  }

  Future<void> fetchUpCommingMovies() async {
    isLoading(true);
    final result = await getUpCommingMoviesUseCase.execute(page: currentPage.value);
    result.fold(
       (l) {

       },(r) {
         upcomingMovies.assignAll(r.results ?? []);
       },
    );
  }
}
