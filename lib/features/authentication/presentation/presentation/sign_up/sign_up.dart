import 'package:flutter/material.dart';

import '../../../../../core/responsive/app_responsive.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../../core/strings/strings.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appWidth(5)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appHeight(5)),
                Text(
                  "Create your Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: appWidth(8),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: appHeight(3)),
                const MyTextField(texts: "Email", icon: Icon(Icons.email)),
                SizedBox(height: appHeight(2)),
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
                    icon: observePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: appHeight(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: appWidth(3.5),
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
                SizedBox(height: appHeight(3)),
                MyElevatedButton(text: "Sign In", onPressed: () {}),
                SizedBox(height: appHeight(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: appWidth(0.2),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: appWidth(2)),
                    Text(
                      "Or Continue with",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: appWidth(3.5),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: appWidth(0.2),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appHeight(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonContinueWith(
                      icon: Icon(
                        Icons.facebook_outlined,
                        size: appWidth(6),
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: appWidth(5)),
                    ButtonContinueWith(
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: appWidth(6),
                        height: appWidth(6),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: appWidth(5)),
                    ButtonContinueWith(
                      icon: Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: appWidth(6),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: appHeight(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHave,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: appWidth(3.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signIn);
                      },
                      child: Text(
                        AppStrings.signIn,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: appWidth(3.5),
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