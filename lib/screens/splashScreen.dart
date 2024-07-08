import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/splashController.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Stack(alignment: Alignment.center,
                children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade500, Colors.lightGreenAccent],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)),
              ),
              Image.asset('assets/images/applogo.png'),
            ]),
          );
        });
  }
}
