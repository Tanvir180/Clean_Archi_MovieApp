import 'package:cleanarchi/src/features/ui/controller/movie_screen_controller.dart';
import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  final MovieScreenController controller;
  const NowPlaying({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.nowPlayingMovies.length,
        itemBuilder: (context, index) {
          final movie = controller.nowPlayingMovies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                width: 120,
              ),
            ),
          );
        },
      ),
    );
  }
}
