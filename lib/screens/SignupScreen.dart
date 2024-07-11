import 'package:dropdownfield2/dropdownfield2.dart';
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<SignupController>(
                init: SignupController(),
                builder: (controller) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Let's create your account",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextField(
                                  controller: controller.emailValue,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    errorText: controller.emailValidate
                                        ? "First name is required"
                                        : null,
                                    hintText: 'First Name',
                                    hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
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
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextField(
                                  controller: controller.emailValue,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    errorText: controller.emailValidate
                                        ? "Last name is required"
                                        : null,
                                    hintText: 'Last Name',
                                    hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: controller.emailValue,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            errorText: controller.emailValidate
                                ? "Phone number is required"
                                : null,
                            hintText: 'Your phone number',
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
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: controller.emailValue,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            errorText: controller.emailValidate
                                ? "Guardian's phone number is required"
                                : null,
                            hintText: "Guardian's phone number",
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
                        SizedBox(height: 16,),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            value: controller.selecetedCity,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.grey),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                                controller.selecetedCity = value!;
                                controller.update();
                            },
                            items: controller.citiesList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        // DropDownField(
                        //   controller: controller.citiesSelected,
                        //   hintText: 'Select your City',
                        //   enabled: true,
                        //   itemsVisibleInDropdown: 5,
                        //   items: controller.citiesList,
                        //   onValueChanged: (value){
                        //     controller.selecetedCity = value;
                        //     controller.update();
                        //   },
                        // ),

                        SizedBox(height: 16,),
                        TextField(
                          controller: controller.emailValue,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            errorText: controller.emailValidate
                                ? "Email is required"
                                : null,
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
                            prefixIcon: Icon(Icons.password),
                            errorText: controller.passValidate
                                ? "Password is required"
                                : null,
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
                            prefixIcon: Icon(Icons.password),
                            errorText: controller.confirmPassValidate
                                ? "Confirm Password is required"
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
                        Align(
                          alignment: Alignment.center,
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
                                onTap: () {
                                  Get.to(() => LoginScreen());
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
