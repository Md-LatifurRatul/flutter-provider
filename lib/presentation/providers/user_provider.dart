import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? userName;
  UserProvider({this.userName = 'RTL'});

  void changeUserName({required String newuserName}) async {
    userName = newuserName;
    notifyListeners();
  }
}
