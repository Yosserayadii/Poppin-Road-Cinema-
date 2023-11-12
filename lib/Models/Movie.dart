// Our movie model
class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genre;
  final String title, poster, backdrop, plot;
  final List<Map<String, dynamic>> cast;

  Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.plot,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genre,
    required this.cast,
  });
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
    cast: [
      {
        "originalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/actor_1.png",
      },
      {
        "originalName": "Mattew Damon",
        "movieName": "Carroll",
        "image": "assets/actor_2.png",
      },
      {
        "originalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/actor_3.png",
      },
      {
        "originalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/actor_4.png",
      },
    ],
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
    cast: [
      {
        "originalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/actor_1.png",
      },
      {
        "originalName": "Mattew Damon",
        "movieName": "Carroll",
        "image": "assets/actor_2.png",
      },
      {
        "originalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/actor_3.png",
      },
      {
        "originalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/actor_4.png",
      },
    ],
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
    cast: [
      {
        "originalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/actor_1.png",
      },
      {
        "originalName": "Mattew Damon",
        "movieName": "Carroll",
        "image": "assets/actor_2.png",
      },
      {
        "originalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/actor_3.png",
      },
      {
        "originalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/actor_4.png",
      },
    ],
  ),
];
