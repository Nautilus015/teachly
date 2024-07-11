import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachly/screens/LoginScreen.dart';
import '../screens/onboarding/OnboardingCard.dart';

class OnboardingController extends GetxController {
  static final PageController pageController = PageController(initialPage: 0);
  getPageController() {
    return pageController;
  }
  List<Widget> onboardingPages = [
    OnboardingCard(
      image: 'assets/images/page1.png',
      title: 'Welcome to Your Learning Journey',
      description: "Embark on an educational adventure with interactive lessons to excel in high school.",
      buttonText: 'Next',
      onPress: () {
        pageController.animateToPage(1,
            duration: Durations.long1, curve: Curves.linearToEaseOut);
      },
    ),
    OnboardingCard(
      image: 'assets/images/page2.png',
      title: 'Discover, Learn, Succeed',
      description: 'Access diverse subjects, expert teachers, and track your progress for rewarding learning.',
      buttonText: 'Next',
      onPress: () {
        pageController.animateToPage(2,
            duration: Durations.long1, curve: Curves.linearToEaseOut);
      },
    ),
    OnboardingCard(
      image: 'assets/images/page3.png',
      title: 'Stay Motivated and Achieve More',
      description: 'Achieve more with personalized learning paths, progress tracking, and peer connections.',
      buttonText: 'Done',
      onPress: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('firstTime', false);
        Get.off(() => LoginScreen());
      },
    )
  ];
}
