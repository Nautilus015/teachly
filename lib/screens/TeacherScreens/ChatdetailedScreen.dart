import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/ChatDetailedController.dart';

import 'ChatScreen.dart';

class ChatdetailedScreen extends StatelessWidget {
  const ChatdetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailedController>(
      init: ChatDetailedController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(() => ChatScreen());
            },
          ),
          title: Text(controller.userName),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Add action for more options
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                // This container will hold the chat messages
                // You can replace it with a ListView or other widget to display messages
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Add logic to send message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}