import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/UploadVideoController.dart';
import 'package:teachly/screens/BottomNavigationScreen.dart';

class UploadVideoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.sizeOf(context).height;
    return GetBuilder<UploadVideoController>(
      init: UploadVideoController(),
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.blue,onPressed: controller.pickVideo,child: Icon(color:Colors.white , Icons.add),),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.off(BottomNavigationScreen());
            },
          ),
          backgroundColor: Colors.blue,
          title: Text(
            "Upload Video",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              controller.videoUrl!=null?controller.videoPreviewWidget():Center(child: Padding(
                padding:  EdgeInsets.only(top:size*0.425),
                child: Text(controller.zeroStateText,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
