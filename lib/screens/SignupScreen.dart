import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/controllers/SignupController.dart';
import 'package:teachly/screens/LoginScreen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/designtwo.png'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<SignupController>(
            init: SignupController(),
            builder: (controller) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: controller.emailValue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorText:
                            controller.emailValidate ? "Email Can't Be Empty" : null,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: controller.passValue,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText:
                        controller.passValidate ? "Password Can't Be Empty" : null,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: controller.confirmPassValue,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: controller.confirmPassValidate
                            ? "Confirm Password Can't Be Empty"
                            : null,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        minimumSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        controller.signupWithEmailAndPassword();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
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
                          child: InkWell(onTap: (){
                            Get.to(()=>LoginScreen());
                          },
                            child: Text(
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                'Login'),
                          ),
                        ),
                      ],
                    )
                  ]);
            },
          ),
        ),
      ])),
    );
  }
}
