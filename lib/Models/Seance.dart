class Seance {
  final String ref;
  final String salle;
  final List<Seat>? seats;
  final List<Booking>? bookings;

  Seance({
    required this.ref,
    required this.salle,
    required this.seats,
    required this.bookings,
  });
}

class Seat {
  final bool available;
  final String ref;

  Seat({
    required this.available,
    required this.ref,
  });
}

class Booking {
  final String date;
  final String email;
  final List<String> seats;
  final String tel;

  Booking({
    required this.date,
    required this.email,
    required this.seats,
    required this.tel,
  });
}
