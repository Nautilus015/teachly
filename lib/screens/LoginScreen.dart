import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/LoginController.dart';
import 'package:teachly/screens/SignupScreen.dart';
import 'forgotpwScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(height: 150,
                            image: AssetImage('assets/images/logo.png')),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(textAlign: TextAlign.left,
                            'Welcome back,',
                            style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(textAlign: TextAlign.left,
                            'Dive right back into your courses and continue your learning journey with us!',
                            style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: controller.emailValue,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            errorText: controller.emailValidate
                                ? "Email Can't Be Empty"
                                : null,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: controller.passValue,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            errorText: controller.passValidate
                                ? "Password Can't Be Empty"
                                : null,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  // This bool value toggles the switch.
                                  value: controller.light,
                                  activeColor: Colors.blue,
                                  onChanged: (bool value) {
                                    controller.light=value;
                                    controller.update();
                                  },
                                ),
                              ),
                            ),
                            Expanded(flex: 25, child: Text('Remind Me')),
                            Expanded(
                              flex: 60,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(()=>forgotpwScreen());
                                    },
                                    child: Text('Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Align(alignment: Alignment.center,
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
                              controller.loginWithEmail();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                  style: TextStyle(fontSize: 18),
                                  "Don't have an account?"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, top: 20),
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=>SignupScreen());
                                },
                                child: Text(
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    'Sign Up'),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              );
            },
          )),
    );
  }

}
