import 'package:flutter/material.dart';

class ButtonControl extends ChangeNotifier{
  bool? isExpense = true;

  void toggle(bool value){
    isExpense = value;
    notifyListeners();
  }
}