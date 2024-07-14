import 'package:get/get.dart';
import 'package:teachly/screens/TeacherScreens/ChatScreen.dart';
import 'package:teachly/screens/ProfileScreen.dart';
import 'package:teachly/screens/SettingsScreen.dart';

import '../screens/HomeScreen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
}
