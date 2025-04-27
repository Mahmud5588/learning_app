import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/responsive/app_responsive.dart';

class MostPopularCoursesPage extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'title': '3D Design Illustration',
      'category': '3D Design',
      'price': 48,
      'oldPrice': 80,
      'rating': 4.8,
      'students': 8289,
      'image': 'assets/images/course1.png',
    },
    {
      'title': 'Digital Entrepreneurship',
      'category': 'Entrepreneurship',
      'price': 39,
      'rating': 4.9,
      'students': 6182,
      'image': 'assets/images/course2.png',
    },
    {
      'title': 'Learn UX User Persona',
      'category': 'UI/UX Design',
      'price': 42,
      'oldPrice': 75,
      'rating': 4.7,
      'students': 7938,
      'image': 'assets/images/course3.png',
    },
    {
      'title': 'Flutter Mobile Apps',
      'category': 'Programming',
      'price': 44,
      'oldPrice': 72,
      'rating': 4.8,
      'students': 9928,
      'image': 'assets/images/course4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.greyScale50,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () {},
        ),
        title: Text(
          'Most Popular Courses',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontSize: appWidth(5),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appWidth(5)),
        child: Column(
          children: [
            SizedBox(height: appHeight(2)),
            _buildCategoryFilters(),
            SizedBox(height: appHeight(2)),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return _buildCourseCard(course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    final categories = ['🔥 All', '💡 3D Design', '💰 Business', '🎨 UI/UX'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Container(
            margin: EdgeInsets.only(right: appWidth(3)),
            padding: EdgeInsets.symmetric(
              horizontal: appWidth(4),
              vertical: appHeight(1),
            ),
            decoration: BoxDecoration(
              color: AppColor.backgroundBlue,
              borderRadius: BorderRadius.circular(appWidth(5)),
              border: Border.all(color: AppColor.greyScale300),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: AppColor.black,
                fontSize: appWidth(3.5),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      margin: EdgeInsets.only(bottom: appHeight(2)),
      padding: EdgeInsets.all(appWidth(3)),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(appWidth(4)),
        boxShadow: [
          BoxShadow(
            color: AppColor.greyScale300,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(appWidth(3)),
            child: Image.asset(
              course['image'],
              width: appWidth(20),
              height: appWidth(20),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: appWidth(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryTag(course['category']),
                SizedBox(height: appHeight(0.5)),
                Text(
                  course['title'],
                  style: TextStyle(
                    fontSize: appWidth(4),
                    fontWeight: FontWeight.bold,
                    color: AppColor.greyScale900,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: appHeight(1)),
                Row(
                  children: [
                    Text(
                      "\$${course['price']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appWidth(4),
                        color: AppColor.blue,
                      ),
                    ),
                    SizedBox(width: appWidth(2)),
                    if (course['oldPrice'] != null)
                      Text(
                        "\$${course['oldPrice']}",
                        style: TextStyle(
                          fontSize: appWidth(3),
                          color: AppColor.greyScale500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: appHeight(1)),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.warning, size: appWidth(4)),
                    SizedBox(width: appWidth(1)),
                    Text(
                      "${course['rating']}",
                      style: TextStyle(
                        fontSize: appWidth(3.5),
                        color: AppColor.greyScale600,
                      ),
                    ),
                    SizedBox(width: appWidth(2)),
                    Text(
                      "| ${course['students']} students",
                      style: TextStyle(
                        fontSize: appWidth(3.5),
                        color: AppColor.greyScale600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.bookmark_outline,
            color: AppColor.info,
            size: appWidth(6),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTag(String category) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: appWidth(3),
        vertical: appHeight(0.5),
      ),
      decoration: BoxDecoration(
        color: AppColor.backgroundBlue,
        borderRadius: BorderRadius.circular(appWidth(2)),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: AppColor.blue,
          fontSize: appWidth(3),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
