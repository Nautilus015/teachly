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
          child: SingleChildScrollView(
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
                                controller: controller.firstName,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  errorText: controller.validates[0]
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
                                controller: controller.lastName,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  errorText: controller.validates[1]
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
                        controller: controller.phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          errorText: controller.validates[2]
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
                        controller: controller.guardiansPhoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          errorText: controller.validates[3]
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
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.location_city),
                              // Your prefix icon
                              SizedBox(width: 8),
                              // Optional space between the icon and dropdown
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: controller.selecetedCity,
                                    icon: const Icon(Icons.arrow_downward),
                                    style: TextStyle(
                                        color: controller.selectColor),
                                    onChanged: (String? value) {
                                      if (value == 'Select your City') {
                                        controller.selectColor = Colors.grey;
                                      } else {
                                        controller.selectColor = Colors.black;
                                      }
                                      controller.selecetedCity = value!;
                                      controller.update();
                                    },
                                    items: controller.citiesList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(value,
                                              style: TextStyle(
                                                color: controller.selectColor,
                                              )),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.school),
                              // Your prefix icon
                              SizedBox(width: 8),
                              // Optional space between the icon and dropdown
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: controller.selecetedGrade,
                                    icon: const Icon(Icons.arrow_downward),
                                    style: TextStyle(
                                        color: controller.selectColorTwo),
                                    onChanged: (String? value) {
                                      if (value == 'Select your Grade') {
                                        controller.selectColorTwo = Colors.grey;
                                      } else {
                                        controller.selectColorTwo =
                                            Colors.black;
                                      }
                                      controller.selecetedGrade = value!;
                                      controller.update();
                                    },
                                    items: controller.grades
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(value,
                                              style: TextStyle(
                                                color:
                                                    controller.selectColorTwo,
                                              )),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          errorText: controller.validates[4]
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
                        controller: controller.password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          errorText: controller.validates[5]
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
                        controller: controller.confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          errorText: controller.validates[6]
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
                            if(!controller.isClicked&&!controller.isLoading){
                              controller.isLoading = true;
                              controller.isClicked = true;
                              controller.signupWithEmailAndPassword();
                              controller.update();
                            }
                          },
                          child: controller.isLoading
                              ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2,
                            ),
                          )
                              : Text(
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
        ),
      ])),
    );
  }
}
