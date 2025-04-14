import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const NotificationsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: screenHeight * 0.1,
        width: screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    width: screenWidth * 0.1,
                    height: screenHeight * 0.1,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(subtitle, textAlign: TextAlign.start),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
