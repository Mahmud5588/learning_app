import 'package:flutter/material.dart';
import 'package:learnig_app/core/strings/strings.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../../core/responsive/app_responsive.dart';
import '../../widget/on_boarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': AppStrings.splash1,
      'image': 'assets/images/on_boarding1.png',
      'buttonText': AppStrings.next,
    },
    {
      'title': AppStrings.splash2,
      'image': 'assets/images/on_boarding2.png',
      'buttonText': AppStrings.next,
    },
    {
      'title': AppStrings.splash3,
      'image': 'assets/images/on_boarding3.png',
      'buttonText': AppStrings.getStarted,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // PageView - onboarding content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingWidget(
                    title: _onboardingData[index]['title'],
                    imagePath: _onboardingData[index]['image'],
                  );
                },
              ),
            ),

            // Indicator dots
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appWidth(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_onboardingData.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: appWidth(1)),
                    height: appHeight(1),
                    width: index == _currentPage ? appWidth(6) : appWidth(2),
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? const Color(0xff3366ff)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(appHeight(0.5)),
                    ),
                  );
                }),
              ),
            ),

            // Button
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: appWidth(5),
                vertical: appHeight(3),
              ),
              child: ResponsiveElevatedButton(
                text: _onboardingData[_currentPage]['buttonText'],
                onPressed: _goToNextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ResponsiveElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ResponsiveElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return SizedBox(
      height: appHeight(7),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff3366ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appHeight(3.5)),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: appHeight(2),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
