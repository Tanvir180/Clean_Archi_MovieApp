import 'package:cleanarchi/src/features/domain/entity/now_playing_movie_entity.dart';
import 'package:cleanarchi/src/features/domain/usecase/get_now_playing_movies.dart';
import 'package:get/get.dart';

class MovieScreenController extends GetxController {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  var nowPlayingMovies = <MovieEntity>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;

  MovieScreenController(this.getNowPlayingMoviesUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchNowPlayingMovies();
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
        nowPlayingMovies.assignAll(movies.results);
        isLoading(false);
      },
    );
  }
}
