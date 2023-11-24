// Our User model
class Resvation {
  final int id, price;
  final String movieTitle, date, email;
  final List<String> seats;

  Resvation({
    required this.id,
    required this.movieTitle,
    required this.date,
    required this.email,
    required this.seats,
    required this.price,
  });
}

List<Resvation> Resvsation = [
  Resvation(
    id: 1, date: "12/12/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
   Resvation(
    id: 2, date: "12/10/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
   Resvation(
    id: 3, date: "30/12/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
   Resvation(
    id: 4, date: "22/11/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
   Resvation(
    id: 5, date: "15/09/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
   Resvation(
    id: 6, date: "17/10/2023",  movieTitle: 'Me Before you', email: '', seats: ["A2", "A3"], price: 30,
  ),
];
// Our demo Resvation data
