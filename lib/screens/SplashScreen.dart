import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/SplashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return  Stack(alignment: Alignment.center,
                  children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade500, Colors.lightGreenAccent],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                ),
                Image.asset('assets/images/applogo.png'),
              ]);
          }),
    );
  }
}
