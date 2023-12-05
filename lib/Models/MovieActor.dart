class MovieActor {
  final String? image;
  final String? movieName;
  final String? originalName;

  MovieActor({
    required this.image,
    required this.movieName,
    required this.originalName,
  });

  factory MovieActor.fromJson(Map<String, dynamic> json) {
    return MovieActor(
      image: json['image'],
      movieName: json['movieName'],
      originalName: json['originalName'],
    );
  }

  @override
  String toString() {
    return 'Actor{image: $image, movieName: $movieName, originalName: $originalName}';
  }
}
