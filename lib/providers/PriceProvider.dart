import 'package:flutter/material.dart';

class PriceProvider extends ChangeNotifier {
  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  // Method to update the total price
  void updateTotalPrice(double newPrice) {
    _totalPrice = newPrice;
    notifyListeners();
  }
}
