import 'package:flutter/material.dart';
import 'package:learnig_app/core/color/app_color.dart';
import 'package:learnig_app/core/responsive/app_responsive.dart';
import 'package:learnig_app/core/route/route_names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedFilterIndex = 0;
  bool isBookmarked = false;

  final List<String> filters = ['All', '3D Design', 'Business', 'Coding'];

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(appWidth(2.0)),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning 👋',
              style: TextStyle(
                fontSize: appWidth(3.5),
                color: AppColor.greyScale700,
              ),
            ),
            Text(
              'Andrew Ainsley',
              style: TextStyle(
                fontSize: appWidth(4.5),
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: AppColor.black),
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.notifications);
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border, color: AppColor.black),
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.bookmark);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appWidth(4.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: appHeight(2.0)),
                padding: EdgeInsets.symmetric(horizontal: appWidth(4.0)),
                decoration: BoxDecoration(
                  color: AppColor.greyScale200,
                  borderRadius: BorderRadius.circular(appWidth(3.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: AppColor.greyScale500),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.filter_list, color: AppColor.greyScale500),
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ),
              // Banner
              _buildSpecialOfferBanner(),
              SizedBox(height: appHeight(3.0)),
              // Top Mentors
              _buildTopMentors(),
              SizedBox(height: appHeight(3.0)),
              // Most Popular Courses
              _buildPopularCourses(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.info,
        unselectedItemColor: AppColor.greyScale500,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Course'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Transaction'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSpecialOfferBanner() {
    return Container(
      padding: EdgeInsets.all(appWidth(4.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appWidth(4.0)),
        gradient: const LinearGradient(
          colors: [AppColor.gradientBlue, AppColor.info],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('40% OFF',
                  style: TextStyle(
                      fontSize: appWidth(4.0),
                      fontWeight: FontWeight.bold,
                      color: AppColor.white)),
              Text('Today\'s Special',
                  style: TextStyle(
                      fontSize: appWidth(6.0),
                      fontWeight: FontWeight.bold,
                      color: AppColor.white)),
              SizedBox(height: appHeight(1.0)),
              Text('Get a discount for every course order!',
                  style: TextStyle(fontSize: appWidth(3.0), color: AppColor.greyScale200)),
              Text('Only valid for today!',
                  style: TextStyle(fontSize: appWidth(3.0), color: AppColor.greyScale200)),
            ],
          ),
          Text('40%',
              style: TextStyle(
                  fontSize: appWidth(15.0),
                  fontWeight: FontWeight.bold,
                  color: AppColor.white.withOpacity(0.5))),
        ],
      ),
    );
  }

  Widget _buildTopMentors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Mentors',
              style: TextStyle(
                  fontSize: appWidth(4.5),
                  fontWeight: FontWeight.bold,
                  color: AppColor.greyScale900),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.mentors);
              },
              child: Text('See All',
                  style: TextStyle(color: AppColor.info, fontSize: appWidth(3.5))),
            ),
          ],
        ),
        SizedBox(height: appHeight(2.0)),
        SizedBox(
          height: appHeight(12.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {

                },
                child: Padding(
                  padding: EdgeInsets.only(right: appWidth(4.0)),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: appWidth(7.5),
                        backgroundImage: AssetImage('assets/mentor${index + 1}.png'),
                      ),
                      SizedBox(height: appHeight(0.5)),
                      Text('Mentor ${index + 1}',
                          style: TextStyle(
                              fontSize: appWidth(3.0),
                              color: AppColor.greyScale800)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCourses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Popular Courses',
              style: TextStyle(
                  fontSize: appWidth(4.5),
                  fontWeight: FontWeight.bold,
                  color: AppColor.greyScale900),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See All',
                  style: TextStyle(color: AppColor.info, fontSize: appWidth(3.5))),
            ),
          ],
        ),
        SizedBox(height: appHeight(2.0)),
        SizedBox(
          height: appHeight(6.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return _buildCourseFilterButton(filters[index], index == selectedFilterIndex, index);
            },
          ),
        ),
        SizedBox(height: appHeight(2.0)),
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appWidth(3.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(appWidth(3.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: appWidth(25.0),
                  height: appHeight(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(appWidth(2.0)),
                    image: DecorationImage(
                      image: AssetImage('assets/course_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: appWidth(3.0)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3D Design',
                          style: TextStyle(
                              fontSize: appWidth(3.0),
                              color: AppColor.greyScale600)),
                      Text('3D Design Illustration',
                          style: TextStyle(
                              fontSize: appWidth(4.0),
                              fontWeight: FontWeight.bold,
                              color: AppColor.greyScale900)),
                      SizedBox(height: appHeight(1.0)),
                      Row(
                        children: [
                          Text('\$48',
                              style: TextStyle(
                                  fontSize: appWidth(4.0),
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.info)),
                          SizedBox(width: appWidth(2.0)),
                          Text('\$80',
                              style: TextStyle(
                                fontSize: appWidth(3.5),
                                color: AppColor.greyScale600,
                                decoration: TextDecoration.lineThrough,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColor.greyScale500,
                  ),
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseFilterButton(String text, bool isSelected, int index) {
    return Padding(
      padding: EdgeInsets.only(right: appWidth(2.0)),
      child: ChoiceChip(
        label: Text(text),
        selected: isSelected,
        selectedColor: AppColor.info,
        labelStyle: TextStyle(
          color: isSelected ? AppColor.white : AppColor.black,
          fontSize: appWidth(3.5),
        ),
        onSelected: (_) {
          setState(() {
            selectedFilterIndex = index;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appWidth(5.0)),
          side: BorderSide(
              color: isSelected ? AppColor.info : AppColor.greyScale400),
        ),
      ),
    );
  }
}
