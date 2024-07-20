import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../screens/PdfViewerScreen.dart';

class BooksController extends GetxController {

  void navigateToPdfScreen(int index) {
    Get.to(() => PdfViewerScreen(),arguments: index);
  }
}