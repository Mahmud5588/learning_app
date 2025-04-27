import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/responsive/app_responsive.dart';
import 'package:learnig_app/core/route/route_names.dart';
import 'package:learnig_app/core/strings/strings.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/event.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:learnig_app/features/authentication/presentation/bloc/register/register_state.dart';
import 'package:learnig_app/features/authentication/presentation/widget/button_continue_with.dart';
import 'package:learnig_app/features/authentication/presentation/widget/my_elevated_button.dart';
import 'package:learnig_app/features/authentication/presentation/widget/my_textfield.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  bool _isRemember = false;
  bool observePassword = true;
  bool isEmail = true;
  final Talker _talker = TalkerFlutter.init();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, emit) {
        if (emit is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Successfully")));
          Navigator.pushNamed(context, RouteNames.otpPage);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Unsuccessfully")));
        }
      },
      child: Scaffold(
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
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: appHeight(3)),
                  MyTextField(
                    texts: AppStrings.firstName,
                    controller: firstNameController,
                  ),
                  SizedBox(height: appHeight(3)),
                  MyTextField(
                    texts: AppStrings.lastName,
                    controller: lastNameController,
                  ),
                  SizedBox(height: appHeight(3)),
                  MyTextField(
                    texts: isEmail ? AppStrings.email : AppStrings.phoneNumber,
                    icon: Icon(
                      isEmail ? Icons.email : Icons.phone,
                      color: AppColor.greyScale500,
                    ),
                    controller: emailNameController,
                    keyboardType:
                        isEmail
                            ? TextInputType.emailAddress
                            : TextInputType.phone,
                    element: IconButton(
                      icon: Icon(
                        isEmail ? Icons.phone_android : Icons.email,
                        color: AppColor.greyScale500,
                      ),
                      onPressed: () {
                        setState(() {
                          isEmail = !isEmail;
                          emailNameController.clear();
                        });
                      },
                    ),
                  ),

                  SizedBox(height: appHeight(2)),
                  MyTextField(
                    texts: AppStrings.password,
                    obscureText: observePassword,
                    controller: passwordNameController,
                    icon: const Icon(Icons.lock, color: AppColor.greyScale500),
                    element: IconButton(
                      onPressed: () {
                        setState(() {
                          observePassword = !observePassword;
                        });
                      },
                      icon:
                          observePassword
                              ? const Icon(
                                Icons.visibility,
                                color: AppColor.greyScale500,
                              )
                              : const Icon(
                                Icons.visibility_off,
                                color: AppColor.greyScale500,
                              ),
                    ),
                  ),
                  SizedBox(height: appHeight(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.rememberMe,
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
                  MyElevatedButton(
                    text: AppStrings.signUp,
                    onPressed: () {
                      final firstName = firstNameController.text.trim();
                      final lastName = lastNameController.text.trim();
                      final emailOrPhone = emailNameController.text.trim();
                      final password = passwordNameController.text.trim();

                      if (firstName.isEmpty ||
                          lastName.isEmpty ||
                          emailOrPhone.isEmpty ||
                          password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Hamma fieldni to'ldir"),
                          ),
                        );
                        return;
                      }

                      if (isEmail) {
                        context.read<RegisterBloc>().add(
                          AuthRegisterEmailEvent(
                            firstName: firstName,
                            lastName: lastName,
                            email: emailOrPhone,
                            password: password,
                          ),
                        );
                      } else {
                        context.read<RegisterBloc>().add(
                          AuthRegisterPhoneEvent(
                            firstName: firstName,
                            lastName: lastName,
                            password: password,
                            phoneNumber: emailOrPhone,
                          ),
                        );
                      }
                    },
                  ),
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
                        AppStrings.orWith,
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
                      SizedBox(height: AppResponsive.height(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
