import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/strings/strings.dart';
import 'package:learnig_app/core/textstyle/app_text_style.dart';

import '../../../../../core/route/route_names.dart';
import '../../widget/my_elevated_button.dart';
import '../../widget/my_textfield.dart';
import '../../../../../core/responsive/app_responsive.dart';

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

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          AppStrings.createNewPassword,
          style: AppTextStyles.heading4(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.sendCodePage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(appWidth(4)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight(30),
                  child: Center(
                    child: Image.asset("assets/images/create_new_password.png"),
                  ),
                ),
                SizedBox(height: appHeight(5)),
                Text(
                  AppStrings.your,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.bodyXLargeMedium(color: AppColor.greyScale500),
                ),
                SizedBox(height: appHeight(3)),
                MyTextField(
                  texts: AppStrings.newPassword,
                  obscureText: observePassword,
                  icon: const Icon(Icons.lock, color: Colors.black),
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
                MyTextField(
                  texts: AppStrings.repeatPassword,
                  obscureText: observeRepeatPassword,
                  icon: const Icon(Icons.lock, color: Colors.black),
                  element: IconButton(
                    onPressed: () {
                      setState(() {
                        observeRepeatPassword = !observeRepeatPassword;
                      });
                    },
                    icon: observeRepeatPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: appHeight(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.rememberMe,
                      style: AppTextStyles.bodyLargeSemiBold(color: AppColor.greyScale500),
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
                SizedBox(height: appHeight(2.5)),
                MyElevatedButton(
                  text: AppStrings.continueWord,
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
  AppResponsive.init(context);

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
          padding: EdgeInsets.symmetric(
            horizontal: appWidth(6),
            vertical: appHeight(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/Group.png", height: appHeight(12)),
              SizedBox(height: appHeight(2.5)),
              Text(
                AppStrings.congratulations,
                style: AppTextStyles.bodyLargeSemiBold(color: AppColor.blue),
              ),
              SizedBox(height: appHeight(1.5)),
              Text(
                AppStrings.congratulationsAboutPassword,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLargeRegular(),
              ),
              SizedBox(height: appHeight(3)),
              const SpinKitCircle(color: Colors.blue, size: 40),
            ],
          ),
        ),
      );
    },
  );
}
