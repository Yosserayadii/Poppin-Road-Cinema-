import 'package:flutter/material.dart';

class SelectedSeatsProvider with ChangeNotifier {
  List<String> _selectedSeatNumbers = [];

  List<String> get selectedSeatNumbers => _selectedSeatNumbers;

  void updateSelectedSeats(List<String> seatNumbers) {
    _selectedSeatNumbers = seatNumbers;
    notifyListeners();
  }
}
