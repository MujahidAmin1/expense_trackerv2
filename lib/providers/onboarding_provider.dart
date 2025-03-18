import 'package:expense_tracker_v2/screens/home.dart';
import 'package:expense_tracker_v2/utils/kNavigate.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  var pageController = PageController();
  var currentPage = 0;
  void updatePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void nextPage(BuildContext context, int index) {
    if (currentPage == 2) {
      navigateTo(context, const HomeScreen());
    } else {
      pageController.jumpToPage(currentPage + 1);
    }
  }

  void skipPage() {
    pageController.jumpToPage(2);
    notifyListeners();
  }
}
