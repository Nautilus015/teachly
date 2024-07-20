import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/VideoPlayController.dart';
import 'BottomNavigationScreen.dart';

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
                Get.off(() => BottomNavigationScreen());
              },
            ),
            title: const Text('Play Video'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
              AspectRatio(
              aspectRatio: controller.controller!.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(controller.controller!),
                    ClosedCaption(text: controller.controller!.value.caption.text),
                    _ControlsOverlay(controller: controller.controller!),
                    VideoProgressIndicator(controller.controller!, allowScrubbing: true),
                  ],
                ),
              )
            ],
          ),
                  // GestureDetector(
                  //   onTap: (){
                  //     controller.controller!.value.isPlaying ? controller.controller!.pause() : controller.controller!.play();
                  //     controller.update();
                  //   },
                  //   child: AspectRatio(aspectRatio: controller.controller!.value.aspectRatio,
                  //     child: VideoPlayer(controller.controller!),
                  //   ),
                  // ),VideoProgressIndicator(controller.controller!, allowScrubbing: true)
            ),
          ),
        )
    );
  }
}
class _ControlsOverlay extends StatelessWidget {
   _ControlsOverlay({required this.controller});
  static  List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static  List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];
  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayController>(
      init: VideoPlayController(),
      builder: (controller)=>Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.controller!.value.isPlaying
                ? const SizedBox.shrink()
                : const ColoredBox(
              color: Colors.black26,
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 100.0,
                  semanticLabel: 'Play',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.controller!.value.isPlaying ? controller.controller!.pause() : controller.controller!.play();
              controller.update();
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: PopupMenuButton<Duration>(
              initialValue: controller.controller!.value.captionOffset,
              tooltip: 'Caption Offset',
              onSelected: (Duration delay) {
                controller.controller!.setCaptionOffset(delay);
                controller.update();
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<Duration>>[
                  for (final Duration offsetDuration in _exampleCaptionOffsets)
                    PopupMenuItem<Duration>(
                      value: offsetDuration,
                      child: Text('${offsetDuration.inMilliseconds}ms'),
                    )
                ];
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // Using less vertical padding as the text is also longer
                  // horizontally, so it feels like it would need more spacing
                  // horizontally (matching the aspect ratio of the video).
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text('${controller.controller!.value.captionOffset.inMilliseconds}ms',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<double>(
              initialValue: controller.controller!.value.playbackSpeed,
              tooltip: 'Playback speed',
              onSelected: (double speed) {
                controller.controller!.setPlaybackSpeed(speed);
                controller.update();
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<double>>[
                  for (final double speed in _examplePlaybackRates)
                    PopupMenuItem<double>(
                      value: speed,
                      child: Text('${speed}x'),
                    )
                ];
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // Using less vertical padding as the text is also longer
                  // horizontally, so it feels like it would need more spacing
                  // horizontally (matching the aspect ratio of the video).
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text('${controller.controller!.value.playbackSpeed}x',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ],
      )
    );
  }
}
