import 'package:cleanarchi/src/features/ui/Widgets/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cleanarchi/src/features/ui/controller/movie_screen_controller.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<MovieScreenController>(); // Retrieve the controller

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/appBar.png', height: 60, width: 120),
      ),
      drawer: const Drawer(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.nowPlayingMovies.isEmpty) {
          return const Center(child: Text('No movies available.'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Now Playing',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              NowPlaying(controller: controller),


            ],
          ),
        );
      }),
    );
  }
}
