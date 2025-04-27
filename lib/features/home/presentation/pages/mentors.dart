import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/responsive/app_responsive.dart';

class TopMentorsPage extends StatelessWidget {
  final List<Map<String, String>> mentors = [
    {
      'name': 'Jacob Kulikowski',
      'position': 'Marketing Analyst',
    },
    {
      'name': 'Claire Ordonez',
      'position': 'VP of Sales',
    },
    {
      'name': 'Priscilla Ehrman',
      'position': 'UX Designer',
    },
    {
      'name': 'Wade Chenail',
      'position': 'Manager, Solution Engineering',
    },
    {
      'name': 'Kathryn Pera',
      'position': 'Product Manager',
    },
    {
      'name': 'Francene Vandyne',
      'position': 'EVP and GM, Sales Cloud',
    },
    {
      'name': 'Benny Spanbauer',
      'position': 'Senior Product Manager',
    },
    {
      'name': 'Jamel Eusebio',
      'position': 'Product Designer',
    },
    {
      'name': 'Cyndy Lillibridge',
      'position': 'VP of Marketing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Top Mentors',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColor.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appWidth(5),
              vertical: appHeight(1),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: appWidth(7),
                  backgroundImage: AssetImage('assets/images/mentor.png'),
                ),
                SizedBox(width: appWidth(4)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mentor['name']!,
                        style: TextStyle(
                          fontSize: appWidth(4),
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyScale900,
                        ),
                      ),
                      SizedBox(height: appHeight(0.5)),
                      Text(
                        mentor['position']!,
                        style: TextStyle(
                          fontSize: appWidth(3.5),
                          color: AppColor.greyScale600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.message_outlined,
                    color: AppColor.info,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
