import 'package:flutter/material.dart';

class FontSizeController with ChangeNotifier {
  int _value = 20;

  int get value => _value;
  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}
