import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/VideoPlay.dart';
import '../controllers/LecturesController.dart';
import 'UploadVideoScreen.dart';

class LecturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LecturesController>(
      init: LecturesController(),
      builder: (controller) => Scaffold(
        floatingActionButton:controller.isTeacher? FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => Get.to(() => UploadVideoScreen()),
          child: Icon(color: Colors.white, Icons.video_library),
        ):null,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text(
            "Lectures",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              StreamBuilder(
                  stream: controller.fireStore.collection('videos').snapshots(),
                  builder: (context, snapshot) {
                    List<Widget> videoWidgets = [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      const CircularProgressIndicator();
                    } else {
                      final videos = snapshot.data!.docs.reversed.toList();
                      for (var video in videos) {
                        final videoWidget = Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(video['downloadUrlImage']),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      video['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    IconButton(
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.black),
                                      onPressed: () {
                                        Get.to(() => VideoPlay(), arguments: [
                                          video['url'],
                                          video['name']
                                        ]);
                                      },
                                      icon: Icon(Icons.play_arrow_rounded),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Text(
                                  video['duration'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                        // Row(
                        //   children: [
                        //     Text(video['name']),
                        //     Expanded(child: Image.network(video['downloadUrlImage']))
                        //   ],
                        // );
                        videoWidgets.add(videoWidget);
                      }
                    }
                    return Expanded(
                        child: ListView(
                      children: videoWidgets,
                    ));
                    // return Column(
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 5, top: 5),
                    //       child: Text("Welcome back,"),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 5),
                    //       child: Text(
                    //         controller.userName,
                    //         style:
                    //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //
                    //     Center(
                    //         child: Padding(
                    //       padding: EdgeInsets.only(
                    //           top: MediaQuery.sizeOf(context).height * 0.35),
                    //       child: Text('No videos avilable',
                    //           style: TextStyle(color: Colors.grey)),
                    //     )),
                    //   ],
                    // );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
