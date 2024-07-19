import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../models/UserModel.dart';

class UploadVideoController extends GetxController {
  String? videoUrl;
  String? downloadUrl;
  TextEditingController videoName = TextEditingController();
  final picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  VideoPlayerController? controller;
  XFile? videoFile;
  bool isLoading =false;
  String zeroStateText='No video Selected';


  pickVideo() async {
    try {
      videoFile = await picker.pickVideo(source: ImageSource.gallery);
      videoUrl = videoFile!.path;
      initializeVideoPlayer();
      update();
    } catch (e) {
      print('Error! : $e');
    }
  }

  initializeVideoPlayer() {
    controller = VideoPlayerController.file(File(videoUrl!))
      ..initialize().then((_) {
        update();
      });
  }

  Widget videoPreviewWidget() {
    if (controller != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: VideoPlayer(controller!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: videoName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.video_chat),
                hintText: 'Your phone number',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if(isLoading==false){
                  _uploadVideo();
                }
              },
              child:isLoading
                  ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
                  : Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }

  Future<String> uploadVideo() async {
    Reference ref = storage.ref().child('videos/${DateTime.now()}.mp4');
    await ref.putFile(File(videoUrl!));
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  _uploadVideo() async {
    isLoading=true;
    update();
    try{
      downloadUrl = await uploadVideo();
      await saveVideoData(downloadUrl!);
    }
    catch(e){
      GetSnackBar(
        titleText: Text(
          'Error!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        messageText: Text(e.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white)),
        icon: const Icon(
          Icons.dangerous,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      );
    }
  }

  saveVideoData(String videoDownloadUrl) async {
    await fireStore.collection('videos').add({
      'url': downloadUrl,
      'timeStamp': FieldValue.serverTimestamp(),
      'name': videoName.text.trim()
    }).then((_){videoUrl=null;videoName.text=''; isLoading=false;zeroStateText='Video Uploaded Successfully'; update();});
  }
}
