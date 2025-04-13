import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../core/route/route_names.dart';
import '../../../authentication/presentation/widget/my_elevated_button.dart';
import '../../../authentication/presentation/widget/my_textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? selectedGender;
  String selectedPhone = "+998"; // Default qiymat
  File? _image;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderNameController = TextEditingController();

  Future<void> imagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    } else {}
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, //
              onPrimary: Colors.white, //
              surface: Colors.white, //
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateBirthController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _updateFields() {
    setState(() {});
  }

  @override
  void initState() {
    emailController.addListener(_updateFields);
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    nickNameController.dispose();
    dateBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    genderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Fill Your Profile",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.signIn);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child:
                            _image == null
                                ? Image.asset(
                                  "assets/images/account_profile.png",
                                )
                                : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: imagePicker,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),

                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyTextField(
                    texts: "FullName",
                    controller: fullNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyTextField(
                    texts: "NickName",
                    controller: nickNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: MyTextField(
                        texts: "DateBirth",
                        controller: dateBirthController,
                        element: Icon(Icons.calendar_today, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyTextField(
                    controller: emailController,
                    texts: "Email",
                    element: Icon(
                      Icons.email_outlined,
                      color:
                          emailController.text.isEmpty
                              ? Colors.grey
                              : Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyTextField(
                    texts: "Phone Number",
                    controller: phoneNumberController,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Image.asset(
                            "assets/images/usa.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 70,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: true,
                              value: selectedPhone,
                              items:
                                  <String>["+998", "+996"].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPhone = newValue ?? "+998";
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyTextField(
                    texts: "Gender",
                    controller: genderNameController,
                    element: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      value: selectedGender,
                      hint: Text("Select Gender"),
                      items:
                          <String>["Male", "Female"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue;
                          genderNameController.text = newValue ?? "";
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  MyElevatedButton(text: "Continue", onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
