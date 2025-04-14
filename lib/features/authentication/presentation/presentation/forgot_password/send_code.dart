import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnig_app/core/strings/strings.dart';


import '../../../../../core/route/route_names.dart';
import '../../../../../core/textstyle/app_text_style.dart';
import '../../widget/code_field.dart';
import '../../widget/my_elevated_button.dart';

class SendCodePage extends StatefulWidget {
  const SendCodePage({super.key});

  @override
  State<SendCodePage> createState() => _SendCodePageState();
}

class _SendCodePageState extends State<SendCodePage> {
  int _seconds = 60;
  Timer? _timer;
  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  final FocusNode _node3 = FocusNode();
  final FocusNode _node4 = FocusNode();

  void _startTimer() {
    _timer?.cancel();
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    super.dispose();
  }

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
          AppStrings.forgotPassword,
          style: AppTextStyles.heading4()
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.forgotPasswordPage);
          },
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
                  "${AppStrings.codeSend} +1 111 ******99",
                  style:AppTextStyles.bodyLargeMedium(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CodeField(currentNode: _node1),
                    SizedBox(width: 10),
                    CodeField(currentNode: _node2),
                    SizedBox(width: 10),
                    CodeField(currentNode: _node3),
                    SizedBox(width: 10),
                    CodeField(currentNode: _node4),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  _seconds > 0
                      ? "Resend code in $_seconds seconds"
                      : "You can now resend the code",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.3),
                MyElevatedButton(
                  text: AppStrings.verify,
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
