import 'package:flutter/material.dart';

import '../../../../../core/route/route_names.dart';
import '../../widget/continue_with_button.dart';
import '../../widget/my_elevated_button.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(child: Image.asset("assets/images/sign_in.png")),

                Text(
                  "Let's you in",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.08,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Facebook",
                  icon: Icon(
                    Icons.facebook,
                    size: screenWidth * 0.06,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Google",
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Apple",
                  icon: Icon(
                    Icons.apple,
                    size: screenWidth * 0.06,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: screenWidth * 0.002,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: screenWidth * 0.002,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                MyElevatedButton(
                  text: "Sign in with password",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUp);
                      },
                      child: Text(
                        "Sign up",
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
