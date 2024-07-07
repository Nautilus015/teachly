import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/splashController.dart';

class splashScreen extends StatelessWidget {
   splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init:SplashController(),builder: (controller){
        return Scaffold(
          body: Center(
            child: Text('Splash Screen'),
          ),
        );
    }
    );
  }

}
