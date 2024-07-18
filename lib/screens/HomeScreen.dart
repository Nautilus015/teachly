import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/HomeController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller)=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/images/lectures.png'),
                                SizedBox(height: 8),
                                Text('Lectures', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/images/assignment.png'),
                                SizedBox(height: 8),
                                Text('Assignment', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/images/quiz.png'),
                                SizedBox(height: 8),
                                Text('Quizes', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/images/bouns.png'),
                                SizedBox(height: 8),
                                Text('Bounses', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text('Top Mentors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/applogo.png'), // Replace with actual image
                      ),
                      title: Text('Kali mona'),
                      subtitle: Text('Leading UI/UX expert'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}