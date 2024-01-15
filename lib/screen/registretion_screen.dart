import 'dart:developer';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final referenceController = TextEditingController();
  static File? profilepic;
  final dobController = TextEditingController();
  // Image Upload


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration Form'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () async {
                        try {
                          XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                          if (selectedImage != null) {
                            File convertedFile = File(selectedImage.path);
                            setState(() {
                              profilepic = convertedFile;
                              UploadTask uploadTask = FirebaseStorage.instance
                                  .ref()
                                  .child("profilepictures")
                                  .child(Uuid().v1())
                                  .putFile(profilepic!);
                            });
                            log('Image selected');
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please select a profile picture',
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        } catch (e) {
                          print('ImagePicker error: $e');
                          // Handle the error as needed, e.g., show an error message to the user.
                          Get.snackbar(
                            'Error',
                            'An error occurred while selecting the image',
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                      child:  CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            (profilepic != null) ? FileImage(profilepic!) : null,
                        backgroundColor: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'Enter user name',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IntlPhoneField(
                      initialCountryCode: 'BD',
                      languageCode: 'BN',
                      controller: nameController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Contact',
                          //hintText: 'Enter phone number',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),


                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: (
                    _universityList()
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                   child: _dateOfBirth(),
                    
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5.00),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('Age: ${getFormattedAge(dobController.text)}',
                      style: const TextStyle(fontSize: 15),),
                    )
                    ,

                  ),


                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'Enter user name',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'Enter user name',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'Enter user name',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        print(nameController.text);
                      },
                      icon: Icon(Icons.how_to_reg),
                      label: Text('Registration')))
            ],
          ),
        ),
      )),
    );
  }
  Widget _universityList(){
    return  Row(

      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.4,
          child: DropDownTextField(
            textFieldDecoration: const InputDecoration(
                hintText: 'Select institution name',
                labelText: 'University',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  gapPadding: 4,
                )
            ),

            listSpace: 20,
            listPadding: ListPadding(top: 10),
            enableSearch: true,
            validator: (value){
              if(value==null){
                return 'Please Select your institution name';
              }
              else{
                return null;
              }
            },
            dropdownColor: Colors.green,
            onChanged: ((value){
              setState(() {
                // if needs apply logic
              });

            }),
            dropDownList: [
              DropDownValueModel(name: "DU", value: 'Dhaka University')
            ],

          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(

          width: MediaQuery.of(context).size.width*0.4,
          child: DropDownTextField(
            textFieldDecoration: const InputDecoration(
              hintText: 'Select education level',
              labelText: 'Level of Education',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  style: BorderStyle.solid,
                ),
                gapPadding: 4,
              )
            ),

            listSpace: 20,
            listPadding: ListPadding(top: 10),
            enableSearch: true,
            validator: (value){
              if(value==null){
                return 'Please Select your institution name';
              }
              else{
                return null;
              }
            },
            dropdownColor: Colors.green,
            onChanged: ((value){
              setState(() {
                // if needs apply logic
              });

            }),
            dropDownList: [
              DropDownValueModel(name: "DU", value: 'Dhaka University')
            ],

          ),
        ),

      ],
    );
  }

  Widget _dateOfBirth() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: dobController,
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          border: OutlineInputBorder(),
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (selectedDate != null) {
            setState(() {
              // Format the selected date as a string and update the controller
              dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
            });
          }
        },
      ),
    );
  }

  String getFormattedAge(String dob) {
    if (dob.isEmpty) {
      return 'N/A'; // Return 'N/A' if DOB is not provided
    }

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);

    int ageYears = currentDate.year - birthDate.year;
    int ageMonths = currentDate.month - birthDate.month;
    int ageDays = currentDate.day - birthDate.day;

    if (ageDays < 0) {
      ageMonths--;
      ageDays += DateTime(currentDate.year, currentDate.month - 1, 0).day;
    }

    if (ageMonths < 0) {
      ageYears--;
      ageMonths += 12;
    }

    return '$ageYears years, $ageMonths months, $ageDays days';
  }
}

  // age calculation
  int calculateAge(String dob) {
    if (dob.isEmpty) {
      return 0; // Return 0 if DOB is not provided
    }

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);

    int age = currentDate.year - birthDate.year;

    // Adjust age based on month and day
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }



