import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int _selected_index = 0;
  int get selectedIndex => _selected_index;
  void changeIndex(int index){
    _selected_index = index;
    notifyListeners();
  }
}
