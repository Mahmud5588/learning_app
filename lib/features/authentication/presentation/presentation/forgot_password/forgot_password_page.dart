import 'package:flutter/material.dart';

import '../../../../../core/route/route_names.dart';
import '../../widget/forgot_widget.dart' show ContactOptionCard;
import '../../widget/my_elevated_button.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  child: Center(
                    child: Image.asset("assets/images/forgot_password.png"),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Select which contact details should we use to reset your password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  children: [
                    ContactOptionCard(
                      icon: Icons.sms,
                      title: "Via SMS",
                      value: "+1 111 ******99",
                      isSelected: selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ContactOptionCard(
                      icon: Icons.email,
                      title: "Via Email",
                      value: "and***ley@yourdomain.com",
                      isSelected: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),

                MyElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.sendCodePage);
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
