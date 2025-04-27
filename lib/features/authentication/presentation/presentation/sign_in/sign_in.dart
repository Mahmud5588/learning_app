import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/strings/strings.dart';
import '../../../../../core/responsive/app_responsive.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../../core/textstyle/app_text_style.dart';
import '../../widget/continue_with_button.dart';
import '../../widget/my_elevated_button.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: AppColor.black),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appWidth(5)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(child: Image.asset("assets/images/sign_in.png")),
                Text(
                  AppStrings.letsYouIn,
                  style: AppTextStyles.heading1(),
                ),
                SizedBox(height: appHeight(3)),
                ContinueWithButton(
                  onPressed: () {},
                  texts: AppStrings.continueFacebook,
                  icon: Icon(
                    Icons.facebook,
                    size: appWidth(6),
                    color: AppColor.blue,
                  ),
                ),
                SizedBox(height: appHeight(2)),
                ContinueWithButton(
                  onPressed: () {},
                  texts: AppStrings.continueGoogle,
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: appWidth(5),
                    height: appWidth(5),
                  ),
                ),
                SizedBox(height: appHeight(2)),
                ContinueWithButton(
                  onPressed: () {},
                  texts: AppStrings.continueApple,
                  icon: Icon(
                    Icons.apple,
                    size: appWidth(6),
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: appHeight(3)),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: appWidth(0.2),
                      ),
                    ),
                    SizedBox(width: appWidth(2)),
                    Text(
                      AppStrings.or,
                      style: AppTextStyles.bodyXLargeSemiBold(color: AppColor.greyScale500),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColor.greyScale500,
                        thickness: appWidth(0.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appHeight(3)),
                MyElevatedButton(
                  text: AppStrings.signInWithPassword,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                ),
                SizedBox(height: appHeight(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveNotAccount,
                      style: TextStyle(
                        color: AppColor.greyScale500,
                        fontSize: appWidth(3.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUp);
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          color: AppColor.blue,
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