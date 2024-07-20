import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/BooksController.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text(
            "Books",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<BooksController>(
              init: BooksController(),
              builder: (controller)=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            controller.navigateToPdfScreen(0);
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/dunebuggy.png'),
                                  SizedBox(height: 8),
                                  Text('Dune Buggy', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            controller.navigateToPdfScreen(1);
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/jake.png'),
                                  SizedBox(height: 8),
                                  Text("Jake's Tale", style: TextStyle(fontSize: 16)),
                                ],
                              ),
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
                        child: InkWell(
                          onTap: (){
                            controller.navigateToPdfScreen(2);
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/peg.png'),
                                  SizedBox(height: 8),
                                  Text('Peg The Hen', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            controller.navigateToPdfScreen(3);
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/tinman.png'),
                                  SizedBox(height: 8),
                                  Text('The Big Hit', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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