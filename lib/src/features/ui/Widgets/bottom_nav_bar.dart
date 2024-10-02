import 'package:cleanarchi/src/features/ui/screens/moviescreen.dart';
import 'package:cleanarchi/src/features/ui/screens/sampleLogin.dart';
import 'package:cleanarchi/src/features/ui/screens/searchScreen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.teal,
          height: 60,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.movie),
                text: "Movies",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.login),
                text: "LOGIN",
              ),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: [
            const MovieScreen(),
            const Searchscreen(),
            MyFormPage()

          ],
        ),
      ),
    );
  }
}
