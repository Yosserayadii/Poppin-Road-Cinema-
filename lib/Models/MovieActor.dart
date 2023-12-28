class MovieActor {
  final String? image;
  final String? movieName;
  final String? originalName;

  MovieActor({
    required this.image,
    required this.movieName,
    required this.originalName,
  });

  @override
  String toString() {
    return 'Actor{image: $image, movieName: $movieName, originalName: $originalName}';
  }

  static List<MovieActor> listCasts = [
    MovieActor(
      image: "assets/actor_1.png",
      movieName: "Director",
      originalName: "James Mangold",
    ),
    MovieActor(
      image: "assets/actor_2.png",
      movieName: "Carroll",
      originalName: "Matt Damon",
    ),
    MovieActor(
      image: "assets/actor_3.png",
      movieName: "Ken Miles",
      originalName: "Christian Bale",
    ),
    MovieActor(
      image: "assets/actor_4.png",
      movieName: "Mollie",
      originalName: "Caitriona Balfe",
    ),
  ];
}
