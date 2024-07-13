import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/ProfileScreen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(color: Colors.green),
    Container(color: Colors.purple),
    ProfileScreen(),
    Container(color: Colors.blue)
  ];
}
