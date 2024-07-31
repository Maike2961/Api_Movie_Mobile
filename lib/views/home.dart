import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../urls/url.dart';
import '../consts/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Api _getComing = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Show Spot"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Upcoming",
               style: style()
              ),
              FutureBuilder(
                future: _getComing.getUpcomingMovies(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movie = snapshot.data!;

                  return CarouselSlider.builder(
                      itemCount: movie.length,
                      itemBuilder: (context, index, movieIndex) {
                        final movies = movie[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movies.backdropPath}"),
                        );
                      },
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 2)));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular",
                  style: style(),
                ),
              ),
               FutureBuilder(
                  future: _getComing.getPopularMovies(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(itemCount: movies.length, itemBuilder: (context, index, realIndex) {
                      final movie = movies[index];
                      return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.PosterPath}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                    }, options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 1.4,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                    ));
                  },
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Top Rated",
                  style: style(),
                ),
              ),
              FutureBuilder(
                future: _getComing.getTopRatedMovies(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snapshot.data!;
                  return CarouselSlider.builder(itemCount: movies.length, itemBuilder: (context, index, realIndex) {
                    final movie = movies[index];
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original/${movie.PosterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }, options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 1.4,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
