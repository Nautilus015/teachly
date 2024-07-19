import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/VideoPlayController.dart';
import 'bottomnavScreen.dart';

class VideoPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayController>(
      init: VideoPlayController(),
      builder: (controller)=>
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.off(() => bottomnavScreen());
              },
            ),
            title: const Text('Play Video'),
          ),
          body: Center(
            child: Column(
              children: [
                AspectRatio(aspectRatio: controller.controller!.value.aspectRatio,
                  child: VideoPlayer(controller.controller!),
                )
              ],
            ),
          ),
        )
    );
  }
}
