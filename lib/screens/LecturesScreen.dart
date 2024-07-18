import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => Get.to(() => UploadVideoScreen()),
          child: Icon(color: Colors.white, Icons.video_library),
        ),
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
                    List<Row> videoWidgets=[];
                    if(!snapshot.hasData){
                      const CircularProgressIndicator();
                    }
                    else{
                      final videos=snapshot.data!.docs.reversed.toList();
                      for(var video in videos){
                        final videoWidget=Row(
                          children: [
                            Text(video['name']),
                            IconButton(onPressed: (){
                              Get.to(()=>VideoPlay(),arguments: [video['url'],video['name']]);
                            }, icon: Icon(Icons.play_arrow_rounded))
                          ],
                        );
                        videoWidgets.add(videoWidget);
                      }
                    }
                    return Expanded(child: ListView(
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
                  }
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
