import 'package:flutter/material.dart';


import '../../../../../core/route/route_names.dart';
import '../../widget/button_continue_with.dart';
import '../../widget/my_elevated_button.dart';
import '../../widget/my_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isRemember = false;
  bool observePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Create your Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.08,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                const MyTextField(texts: "Email", icon: Icon(Icons.email)),
                SizedBox(height: screenHeight * 0.02),
                MyTextField(
                  texts: "Password",
                  obscureText: observePassword,
                  icon: const Icon(Icons.lock),
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
                SizedBox(height: screenHeight * 0.03),
                MyElevatedButton(text: "Sign In", onPressed: () {}),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: screenWidth * 0.002,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "Or Continue with",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: screenWidth * 0.002,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonContinueWith(
                      icon: Icon(
                        Icons.facebook_outlined,
                        size: screenWidth * 0.06,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    ButtonContinueWith(
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    ButtonContinueWith(
                      icon: Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: screenWidth * 0.06,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signIn);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
