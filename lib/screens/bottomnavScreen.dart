import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class bottomnavScreen extends StatelessWidget {
  const bottomnavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 500),
        items: [
        Icon(Icons.home,
        color: Colors.white,),
        Icon(Icons.favorite,
            color: Colors.white),
        Icon(Icons.search,
            color: Colors.white),
        Icon(Icons.settings,
            color: Colors.white ),
      ],),
    );
  }
}
