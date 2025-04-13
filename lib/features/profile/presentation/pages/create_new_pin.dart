import 'package:flutter/material.dart';


import '../../../../../core/route/route_names.dart';
import '../../../authentication/presentation/widget/code_field.dart';
import '../../../authentication/presentation/widget/my_elevated_button.dart';

class CreateNewPin extends StatefulWidget {
  const CreateNewPin({super.key});

  @override
  State<CreateNewPin> createState() => _CreateNewPinState();
}

class _CreateNewPinState extends State<CreateNewPin> {
  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  final FocusNode _node3 = FocusNode();
  final FocusNode _node4 = FocusNode();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Create New Pin",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Add a PIN number to make your account more secure",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CodeField(obscureCode: true, currentNode: _node1),
                    SizedBox(width: 10),
                    CodeField(obscureCode: true, currentNode: _node2),
                    SizedBox(width: 10),
                    CodeField(obscureCode: true, currentNode: _node3),
                    SizedBox(width: 10),
                    CodeField(obscureCode: true, currentNode: _node4),
                  ],
                ),
                SizedBox(height: screenHeight * 0.3),
                MyElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.createNewPassword);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
