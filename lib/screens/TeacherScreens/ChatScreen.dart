import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/ChatScreenController.dart';
import 'package:teachly/screens/TeacherScreens/ChatdetailedScreen.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Chats'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Student\'s online',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: StreamBuilder(
                          stream: controller.fireStore
                              .collection('users')
                              .snapshots(),
                          builder: (context, snapshot) {
                            List<String> userNames = [];
                            List<String> lastMessages = [];
                            List<String> imagesUrl = [];
                            List<String> emails=[];
                            for (var user in snapshot.data!.docs) {
                              var nickName = user.get('firstName') +
                                  ' ' +
                                  user.get('lastName');
                              var lastMessage = user.get('lastMessage');
                              var imageUrl=user.get('circleAvatarImage');
                              var email=user.get('email');
                              userNames.add(nickName);
                              lastMessages.add(lastMessage);
                              imagesUrl.add(imageUrl);
                              emails.add(email);
                            }
                            return ListView.builder(
                              itemCount: userNames.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:imagesUrl[index]==''? AssetImage(
                                            'assets/images/image.png'):NetworkImage(imagesUrl[index]),
                                      ),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userNames[index],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              lastMessages[index],
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => ChatdetailedScreen(),arguments: [userNames[index],emails[index]]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                        child: Text('Chat'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ));
  }
}
