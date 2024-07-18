import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  String? videoUrl;
  String? videoName;
  VideoPlayerController? controller;
  dynamic theDataFromPreviousPage = Get.arguments;

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }
  @override
  void onInit() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(theDataFromPreviousPage[0]),
    );
    controller!.initialize().then((_) {
      update();
      controller!.play();
    });
    super.onInit();
  }
}
