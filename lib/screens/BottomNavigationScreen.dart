import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';
import '../controllers/BottomNavigationController.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
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
                  icon: Icon(Icons.notifications), label: 'Notifications'),
              NavigationDestination(
                icon:  Icon(Icons.book), label: 'Books'),
              NavigationDestination(
                  icon: Icon(Icons.person), label: 'Profile'),
                        ],
                      ),
            ),
          body: Obx(() => controller.screens[controller.selectedIndex.value]),
        );
      },
    );
  }
}