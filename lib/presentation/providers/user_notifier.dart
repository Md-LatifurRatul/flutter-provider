import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/model/user.dart';

class UserNotifier extends ChangeNotifier {
  List<User> _userList = [];

  int _age = 0;
  int _height = 0;

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  int get age => _age;
  int get height => _height;

  void addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

  void deleteUser(int index) {
    _userList.removeAt(index);
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  void incrementHeight() {
    _height++;
    notifyListeners();
  }
}
