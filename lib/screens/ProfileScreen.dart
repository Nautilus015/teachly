import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ProfileController.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('My Profile'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(controller.isEditMode ? Icons.person : Icons.edit),
                onPressed: () {
                  controller.isEditMode = !controller.isEditMode;
                  controller.update();
                  controller.equalsControllers();
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.imageFile != null
                          ? FileImage(controller.imageFile!)
                          : controller.circleAvatarImage != '' &&
                                  controller.circleAvatarImage != null
                              ? NetworkImage(controller.circleAvatarImage)
                              : AssetImage('assets/images/image.png')),
                  Visibility(
                    visible: controller.isEditMode ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Container(
                        height: 40,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          color: Colors.white,
                          onPressed: () {
                            controller.pickImage();
                            controller.update();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: !controller.isEditMode
                        ? Row(children: [
                            Icon(Icons.person, color: Colors.blue),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(controller.userName),
                            ),
                          ])
                        : Row(
                            children: [
                              Icon(Icons.person, color: Colors.blue),
                              Expanded(
                                child: controller.isEditMode
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            errorText: controller.validates[0]
                                                ? "First name is required"
                                                : null,
                                          ),
                                          controller:
                                              controller.firstNameController,
                                        ),
                                      )
                                    : Text(controller.firstName),
                              ),
                              Expanded(
                                child: controller.isEditMode
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            errorText: controller.validates[1]
                                                ? "Last name is required"
                                                : null,
                                          ),
                                          controller:
                                              controller.lastNameController,
                                        ),
                                      )
                                    : Text(controller.lastName),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.green),
                        SizedBox(width: 16),
                        Expanded(
                          child: controller.isEditMode
                              ? TextField(
                                  decoration: InputDecoration(
                                    errorText: controller.validates[2]
                                        ? "Phone number is required"
                                        : null,
                                  ),
                                  controller: controller.phoneNumberController,
                                )
                              : Text(controller.phoneNumber),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.family_restroom, color: Colors.purple),
                        SizedBox(width: 16),
                        Expanded(
                          child: controller.isEditMode
                              ? TextField(
                                  decoration: InputDecoration(
                                    errorText: controller.validates[3]
                                        ? "Guardian's phone number is required"
                                        : null,
                                  ),
                                  controller:
                                      controller.guardiansPhoneNumberController,
                                )
                              : Text(controller.guardianPhoneNumber),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_city, color: Colors.orange),
                        SizedBox(width: 16),
                        Expanded(
                            child: controller.isEditMode
                                ? DropdownButtonHideUnderline(
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(value,
                                                style: TextStyle(
                                                  color: controller.selectColor,
                                                )),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Text(controller.selecetedCity)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.school, color: Colors.red),
                        SizedBox(width: 16),
                        Expanded(
                            child: controller.isEditMode
                                ? DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: controller.selecetedGrade,
                                      icon: const Icon(Icons.arrow_downward),
                                      style: TextStyle(
                                          color: controller.selectColorTwo),
                                      onChanged: (String? value) {
                                        if (value == 'Select your Grade') {
                                          controller.selectColorTwo =
                                              Colors.grey;
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(value,
                                                style: TextStyle(
                                                  color:
                                                      controller.selectColorTwo,
                                                )),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Text(controller.selecetedGrade)),
                      ],
                    ),
                  ),
                  controller.isEditMode
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
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
                                if (!controller.isClicked &&
                                    !controller.isLoading) {
                                  controller.isLoading = true;
                                  controller.isClicked = true;
                                  controller.checkUser();
                                  controller.update();
                                }
                              },
                              child: controller.isLoading
                                  ? SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        )
                      : Text(''),
                  SizedBox(height: 20),
                  Visibility(
                    visible: controller.isEditMode ? false : true,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        controller.signOut();
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
