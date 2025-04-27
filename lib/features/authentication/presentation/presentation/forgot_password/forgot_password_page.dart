import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/strings/strings.dart';
import 'package:learnig_app/core/textstyle/app_text_style.dart';
import '../../../../../core/route/route_names.dart';
import '../../widget/forgot_widget.dart';
import '../../widget/my_elevated_button.dart';
import '../../../../../core/responsive/app_responsive.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppStrings.forgotPassword, style: AppTextStyles.heading4()),
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, RouteNames.signIn),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(appWidth(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: appHeight(30),
                child: Center(
                  child: Image.asset("assets/images/forgot_password.png"),
                ),
              ),
              SizedBox(height: appHeight(4)),
              Text(
                AppStrings.selectContact,
                style: AppTextStyles.bodyLargeMedium(color: AppColor.greyScale500),
              ),
              SizedBox(height: appHeight(2)),
              TextField(
                controller: _emailController,
              ),
              // ContactOptionCard(
              //   icon: Icons.sms,
              //   title: AppStrings.via + AppStrings.sms,
              //   value: "+1 111 ******99",
              //   isSelected: selectedIndex == 0,
              //   onTap: () => setState(() => selectedIndex = 0),
              // ),
              SizedBox(height: appHeight(1)),
              TextField(
                controller: _phoneController,
              ),
              // ContactOptionCard(
              //   icon: Icons.email,
              //   title: AppStrings.via + AppStrings.email,
              //   value: "and***ley@yourdomain.com",
              //   isSelected: selectedIndex == 1,
              //   onTap: () => setState(() => selectedIndex = 1),
              // ),
              SizedBox(height: appHeight(3)),
              MyElevatedButton(
                text: AppStrings.continueWord,
                onPressed: () => Navigator.pushNamed(context, RouteNames.sendCodePage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
