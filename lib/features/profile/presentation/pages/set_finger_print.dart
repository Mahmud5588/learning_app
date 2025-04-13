import 'package:flutter/material.dart';

import '../../../../core/route/route_names.dart';
import '../../../authentication/presentation/widget/my_elevated_button.dart';

class SetFingerPrint extends StatefulWidget {
  const SetFingerPrint({super.key});

  @override
  State<SetFingerPrint> createState() => _SetFingerPrintState();
}

class _SetFingerPrintState extends State<SetFingerPrint> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Set Finger Print",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Add a fingerprint to make your account more secure",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.04),
                Image.asset("assets/images/finger.png"),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  textAlign: TextAlign.center,
                  "Please put your finger on the fingerprint scanner to get started.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.2),
                Row(
                  children: [
                    Expanded(
                      child: MyElevatedButton(
                        text: "Skip",
                        color: Color(0x00ebeffe),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.06),

                    Expanded(
                      child: MyElevatedButton(
                        text: "Continue",
                        onPressed: () {},
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
