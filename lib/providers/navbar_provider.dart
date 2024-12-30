import 'package:expense_trackerv2/screens/statistics.dart';
import 'package:flutter/material.dart';

import '../screens/first_screen.dart';

class NavBarProvider extends ChangeNotifier {
  int _selected_index = 0;
  int get selectedIndex => _selected_index;
  void onTapped(int index){
    _selected_index = index;
    notifyListeners();
  }
}