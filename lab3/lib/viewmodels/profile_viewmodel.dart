import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileViewModel extends ChangeNotifier {
  User _user = User(
    name: 'Анна Краснобаєва',
    title: 'Student',
    bio: 'Працюю, навчаюся, живу.',
    email: 'anna.krasnobaieva@infiz.khpi.edu.ua',
    phone: '+380123123123',
    avatarUrl: 'https://avatars.githubusercontent.com/u/185949285?v=4',
  );

  User get user => _user;

  void updateBio(String newBio) {
    _user = _user.copyWith(bio: newBio);
    notifyListeners();
  }
}
