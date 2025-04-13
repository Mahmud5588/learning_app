import 'package:flutter/material.dart';

import '../../../../../core/route/route_names.dart';
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
      'title': 'We provide the best learning courses & great mentors!',
      'image': 'assets/images/on_boarding1.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Learn anytime and anywhere easily and conveniently',
      'image': 'assets/images/on_boarding2.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Let\'s improve your skills together with Elera right now!',
      'image': 'assets/images/on_boarding3.png',
      'buttonText': 'Get Started',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Keyingi sahifaga o'tish funksiyasi
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
    // Ekran o'lchamlarini olish
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    // Responsive qiymatlar
    final buttonVerticalMargin = screenHeight * 0.03;
    final horizontalPadding = screenWidth * 0.05; // 5% from each side
    final indicatorHeight = screenHeight * 0.01;
    final indicatorWidth = screenWidth * 0.06;
    final indicatorSmallWidth = screenHeight * 0.01;

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
            // PageView - carousel
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

            // Indicator dots - responsive
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_onboardingData.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                    ),
                    height: indicatorHeight,
                    width:
                        index == _currentPage
                            ? indicatorWidth
                            : indicatorSmallWidth,
                    decoration: BoxDecoration(
                      color:
                          index == _currentPage
                              ? const Color(0xff3366ff)
                              : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(indicatorHeight / 2),
                    ),
                  );
                }),
              ),
            ),

            // Tugma - responsive
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: buttonVerticalMargin,
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

// Responsive ElevatedButton
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
    // Ekran o'lchamlarini olish
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive qiymatlar
    final buttonHeight = screenHeight * 0.07; // Ekran balandligining 7%
    final fontSize = screenHeight * 0.018; // Ekran balandligining 1.8%

    return SizedBox(
      height: buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff3366ff),
          side: const BorderSide(color: Color(0x00eeeeee)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              buttonHeight / 2,
            ),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
