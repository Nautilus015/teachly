import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/NotificationController.dart';
import 'package:teachly/screens/BottomNavigationScreen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) =>
            Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.to(() => BottomNavigationScreen());
                  },
                ),
                title: Text('Notification'),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StreamBuilder(
                                    stream: controller.fireStore
                                        .collection('messages')
                                        .orderBy('createdOn', descending: true)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                        return CircularProgressIndicator();
                                      }else if(snapshot.hasError){
                                        return Icon(Icons.dangerous);
                                      }else if(snapshot.hasData){
                                        List<String> messages = [];
                                        List<String> dates = [];
                                        for (var message in snapshot.data!.docs) {
                                          var msg = message.get('message');
                                          var timestamp = message.get('createdOn') as Timestamp;
                                          var dateTime = timestamp.toDate();
                                          var formattedDate = controller.formatMessageDate(dateTime);
                                          messages.add(msg);
                                          dates.add(formattedDate);
                                        }
                                        return ListView.builder(
                                            reverse: true,
                                            itemCount: messages.length,
                                            itemBuilder: (context, index) {
                                              return Align(
                                                alignment: Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit max width to 70% of screen width
                                                    ),
                                                    child: Container(
                                                      // This container will hold the chat messages
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            Flexible(
                                                              child: Text(messages[index],
                                                                style: TextStyle(color: Colors.black, fontSize: 16),
                                                              ),
                                                            ),
                                                            SizedBox(width: 8),
                                                            Text(dates[index],
                                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 2, color: Colors.blue, style: BorderStyle.solid
                                                        ),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(20),
                                                            bottomLeft: Radius.circular(20),
                                                            bottomRight: Radius.circular(20)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        );
                                      }
                                      else{
                                        return Icon(Icons.dangerous);
                                      }
                                    }
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.isTeacher ? Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.messageText,
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
                              controller.addMessage();
                              controller.messageText.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ) : Text(''),
                ],
              ),
            ));
  }
}
