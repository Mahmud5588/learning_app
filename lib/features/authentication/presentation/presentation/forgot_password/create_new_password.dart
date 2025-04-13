import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/route/route_names.dart';
import '../../widget/my_elevated_button.dart';
import '../../widget/my_textfield.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool observePassword = true;
  bool observeRepeatPassword = true;
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Create New Password",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.sendCodePage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  child: Center(
                    child: Image.asset("assets/images/create_new_password.png"),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Create Your New Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                MyTextField(
                  texts: "New Password",
                  obscureText: observePassword,
                  icon: const Icon(Icons.lock, color: Colors.black),
                  element: IconButton(
                    onPressed: () {
                      setState(() {
                        observePassword = !observePassword;
                      });
                    },
                    icon:
                        observePassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                MyTextField(
                  texts: "Repeat Password",
                  obscureText: observeRepeatPassword,
                  icon: const Icon(Icons.lock, color: Colors.black),
                  element: IconButton(
                    onPressed: () {
                      setState(() {
                        observeRepeatPassword = !observeRepeatPassword;
                      });
                    },
                    icon:
                        observeRepeatPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: _isRemember,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isRemember = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MyElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    showCongratsDialog(context);
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

void showCongratsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, RouteNames.signIn);
      });

      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/Group.png", height: 100),
              const SizedBox(height: 20),
              const Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Your account is ready to use.\nYou will be redirected to the Home page\nin a few seconds.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              const SpinKitCircle(color: Colors.blue, size: 40),
            ],
          ),
        ),
      );
    },
  );
}
