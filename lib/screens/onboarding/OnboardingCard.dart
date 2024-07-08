import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/OnboardingController.dart';

class OnboardingCard extends StatelessWidget {
  final String image, title, description, buttonText;
  final Function onPress;

  const OnboardingCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          MaterialButton(
            onPressed: () {
              onPress();
            },
            color: Colors.blueAccent,
            minWidth: MediaQuery.sizeOf(context).width * 0.75,
            height:MediaQuery.sizeOf(context).height*0.060,
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
