import 'package:poppinroadcimema/Models/MovieActor.dart';

class Movie {
  final String? backdrop;
  final List<MovieActor>? cast;
  final int? criticsReview;
  final List<String>? genre;
  final int? id;
  final int? metascoreRating;
  final int? numOfRatings;
  final String? plot;
  final String? poster;
  final double? rating;
  final String? title;
  final int? year;

  Movie({
    required this.backdrop,
    required this.cast,
    required this.criticsReview,
    required this.genre,
    required this.id,
    required this.metascoreRating,
    required this.numOfRatings,
    required this.plot,
    required this.poster,
    required this.rating,
    // required this.seance,
    required this.title,
    required this.year,
  });
  @override
  String toString() {
    return 'Movie{'
        'backdrop: $backdrop, '
        'cast: $cast, '
        'criticsReview: $criticsReview, '
        'genre: $genre, '
        'id: $id, '
        'metascoreRating: $metascoreRating, '
        'numOfRatings: $numOfRatings, '
        'plot: $plot, '
        'poster: $poster, '
        'rating: $rating, '
        'title: $title, '
        'year: $year}';
  }
}

// Our demo movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Ford V Ferrari",
    year: 2020,
    poster: "assets/ford.jpg",
    backdrop: "assets/backdrop_2.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    plot:
        "In Ford V Ferrari Ford Motor Company hires automotive designer Carroll Shelby and talented but challenging driver Ken Miles to build a race car capable of beating Ferrari at the 24 Hours of Le Mans in 1966. The film follows their struggles to create a competitive car, dealing with internal politics, and their journey to the ultimate showdown against Ferrari at Le Mans. The movie is a high-stakes, thrilling racing drama based on a true story.",
    metascoreRating: 76,
    genre: ["Action", "Drama"],
    cast: [],
  ),
  Movie(
    id: 2,
    title: "On Ward",
    year: 2019,
    plot:
        "In a suburban fantasy world, magic has faded into the background, replaced by modern technology. The story centers on two elf brothers, Ian Lightfoot (voiced by Tom Holland) and Barley Lightfoot (voiced by Chris Pratt), who receive a gift from their late father on Ian's 16th birthday: a magical staff and a spell that can bring him back for one day. However, the spell goes awry, and they only manage to conjure their father's lower half",
    poster: "assets/onward.jpeg",
    backdrop: "assets/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genre: ["Action", "Biography", "Drama"],
    cast: [],
  ),
  Movie(
    id: 3, // Changed ID to 3
    title: "The Fault in our Stars",
    year: 2020,
    plot:
        "The Fault in Our Stars is a 2014 American coming-of-age romance film directed by Josh Boone from a screenplay by Scott Neustadter and Michael H. Weber, based on the 2012 novel of the same name by John Green. The film stars Shailene Woodley and Ansel Elgort, with Laura Dern, Sam Trammell, Nat Wolff, and Willem Dafoe in supporting roles. The story centers on a sixteen- year-old cancer patient, played by Woodley, forced by her parents to attend a support group, whe",
    poster: "assets/story.jpg",
    backdrop: "assets/back.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genre: ["Action", "Drama"],
    cast: [],
  ),
  Movie(
    id: 3, // Changed ID to 3
    title: "Me Before You",
    year: 2020,
    plot:
        "The story revolves around Louisa Clark (played by Emilia Clarke), a cheerful and quirky young woman who loses her job at a café and is desperately seeking new employment to support her family. She lands a job as a caregiver for Will Traynor (played by Sam Claflin), a wealthy and successful young man who, following a motorcycle accident, is now paralyzed and quadriplegic. Will has lost his desire for life and is often bitter and withdrawn.",
    poster: "assets/me.jpg",
    backdrop: "assets/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genre: ["Action", "Drama"],
    cast: [],
  ),
];
