import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/onboarding/OnboardingCard.dart';

class OnboardingController extends GetxController{
  static final PageController pageController = PageController(initialPage: 0);
  getPageController(){
    return pageController;
  }
  List<Widget> onboardingPages = [
    OnboardingCard(
      image: 'assets/images/page1.png',
      title: 'Welcome to Teachly',
      description: 'description: Here you can do whatever you want',
      buttonText: 'Next',
      onPress: () {
        pageController.animateToPage(1, duration:Durations.long1, curve: Curves.linearToEaseOut);
        },
    ),
    OnboardingCard(
      image: 'assets/images/page2.png',
      title: 'Welcome to Teachly',
      description: 'description: Here you can do whatever you want',
      buttonText: 'Next',
      onPress: () {
        pageController.animateToPage(2, duration:Durations.long1, curve: Curves.linearToEaseOut);
      },
    ),
    OnboardingCard(
      image: 'assets/images/page3.png',
      title: 'Welcome to Teachly',
      description: 'description: Here you can do whatever you want',
      buttonText: 'Done',
      onPress: () {
      },
    )
  ];
}