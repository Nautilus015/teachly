import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';
import '../controllers/bottomnavController.dart';

class bottomnavScreen extends StatelessWidget {
  const bottomnavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
            bottomNavigationBar: Obx(
              () => NavigationBar(
                height: 80,
                        elevation: 0,
                        selectedIndex: controller.selectedIndex.value,
                        onDestinationSelected: (index) => controller.selectedIndex.value = index,
                        destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.chat), label: 'Chat'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Settings'),
                        ],
                      ),
            ),
          body: Obx(() => controller.screens[controller.selectedIndex.value]),
        );
      },
    );
  }
}