import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teachly/controllers/OnboardingController.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (controller){
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 85,
                    child: PageView(
                      controller:controller.getPageController(),
                      children: controller.onboardingPages,
                    )),
                Expanded(flex: 15,
                  child: SmoothPageIndicator(effect: ExpandingDotsEffect(),
                      controller: controller.getPageController(), count: 3),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
