import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int value = 0;
  void increment() {
    value++;
    notifyListeners();
  }
}
