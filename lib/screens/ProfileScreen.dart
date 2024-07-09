import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController  dateOfBirth= TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController detailedAddress = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController school = TextEditingController();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Create Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/page2.png'),radius: 50,
                          ),
                        ),
                        Positioned(
                          right: 100,
                          top: 60,
                          child: MaterialButton(
                            onPressed: () {
                            },
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                            ),
                            padding: EdgeInsets.all(10),
                            shape: CircleBorder(
                            ),
                          ),
                        ),
                    ]
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade500, Colors.lightGreenAccent],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('PERSONAL INFO',textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                  fontSize: 21,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: TextField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    suffixIcon: Icon(Icons.calendar_month,color: Colors.blue.shade500,),
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
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: TextField(
                  controller: mobile,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                    suffixIcon: Icon(Icons.phone,color: Colors.blue.shade500,),
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
                padding: const EdgeInsets.all(15.0),
                child: Text('ADDRESS',textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                  fontSize: 21,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: detailedAddress,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.streetview,color: Colors.blue.shade500,),
                    hintText: 'Detailed Address',
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
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: TextField(
                  controller: grade,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Grade',
                    suffixIcon: Icon(Icons.grade,color: Colors.blue.shade500,),
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
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: TextField(
                  controller: school,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'School',
                    suffixIcon: Icon(Icons.school,color: Colors.blue.shade500,),
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
                padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.off(()=>LoginScreen());
                    // Add your onPressed logic here
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
