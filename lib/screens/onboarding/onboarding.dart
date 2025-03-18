import 'package:expense_tracker_v2/providers/onboarding_provider.dart';
import 'package:expense_tracker_v2/utils/kTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<OnBoardingProvider>(context);
    String onboard1 = "assets/onboard1.png";
    String onboard2 = "assets/onboard2.png";
    String onboard3 = "assets/onboard3.png";
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePage,
            children: [
              OnboardPage(image: onboard1, text: "Random Txt"),
              OnboardPage(image: onboard2, text: "Random Txt"),
              OnboardPage(image: onboard3, text: "Random Txt"),
            ],
          ),
          Positioned(
            bottom: 800,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                controller.nextPage(context, controller.currentPage);
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          )
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  String text;
  String image;
  OnboardPage({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Image.asset(image),
        Text(text, style: kTextStyle(size: 20)),
        Text("Random Text", style: kTextStyle(size: 20)),
      ],
    );
  }
}
