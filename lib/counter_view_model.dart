import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _counterOne = 0;
  int _counterTwo = 0;

  int get counterOne => _counterOne;
  int get counterTwo => _counterTwo;

  void incrementCounterOne() {
    _counterOne++;
    notifyListeners();
  }

  void incrementCounterTwo() {
    _counterTwo++;
    notifyListeners();
  }

  void resetAllCounters() {
    _counterOne = 0;
    _counterTwo = 0;
    notifyListeners();
  }
}
