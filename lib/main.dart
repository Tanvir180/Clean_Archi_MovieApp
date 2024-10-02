import 'package:cleanarchi/src/features/Data/repositories/home_rep_imp.dart';
import 'package:cleanarchi/src/features/Data/source/api_services_now_playing.dart';
import 'package:cleanarchi/src/features/domain/usecase/get_now_playing_movies.dart';
import 'package:cleanarchi/src/features/domain/usecase/get_up_comming_movies.dart';
import 'package:cleanarchi/src/features/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/features/ui/controller/movie_screen_controller.dart';

void main() {
  // Create an instance of the remote data source
  final homeRemoteDataSource = HomeRemoteDataSourceImpl(); // Replace with actual constructor

  // Create an instance of the HomeRepositoryImpl with the remote data source
  final movieRepository = HomeRepositoryImpl(remoteDataSource: homeRemoteDataSource);

  // Create an instance of the GetNowPlayingMoviesUseCase
  final getNowPlayingMoviesUseCase = GetNowPlayingMoviesUseCase(movieRepository);

  final getUpCommingMoviesUseCase = GetUpCommingMoviesUseCase(movieRepository);



  // Register the MovieScreenController with its dependencies
  Get.put(MovieScreenController(getNowPlayingMoviesUseCase, getUpCommingMoviesUseCase));

  runApp(const MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MovieDB',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(surface: Colors.white),
      ),
      home: const SplashScreen(),
    );
  }
}
