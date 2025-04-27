import 'package:flutter/material.dart';
import 'package:learnig_app/features/home/presentation/widget/notifications_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // Notification list
  List<Map<String, String>> notifications = [
    {
      "date": "Today",
      "image": "assets/images/notification_payment.png",
      "title": "Payment Successful!",
      "subtitle": "You have made a course payment",
    },
    {
      "date": "Today",
      "image": "assets/images/notifications_prize.png",
      "title": "Today's Special Offers",
      "subtitle": "You get a special promo today!",
    },
    {
      "date": "Yesterday",
      "image": "assets/images/notifications_category.png",
      "title": "New Category Courses!",
      "subtitle": "Now the 3D design course is available",
    },
    {
      "date": "Yesterday",
      "image": "assets/images/notifications_icon.png",
      "title": "Credit Card Connected!",
      "subtitle": "Credit Card has been linked!",
    },
    {
      "date": "December 22, 2024",
      "image": "assets/images/notifications_account.png",
      "title": "Account Setup Successful!",
      "subtitle": "Your account has been created!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty_notifications.png",
              height: screenHeight * 0.25,
            ),
            SizedBox(height: 20),
            Text(
              "No Notifications!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "You're all caught up!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : SingleChildScrollView( // <-- Agar bor bo'lsa
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildNotifications(screenHeight),
        ),
      ),
    );
  }

  List<Widget> buildNotifications(double screenHeight) {
    List<Widget> widgets = [];

    // Group by date
    String? lastDate;
    for (var item in notifications) {
      if (lastDate != item["date"]) {
        widgets.add(SizedBox(height: screenHeight * 0.03));
        widgets.add(
          Text(
            item["date"]!,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        );
        widgets.add(SizedBox(height: screenHeight * 0.015));
        lastDate = item["date"];
      }
      widgets.add(
        NotificationsWidget(
          image: item["image"]!,
          title: item["title"]!,
          subtitle: item["subtitle"]!,
        ),
      );
      widgets.add(SizedBox(height: screenHeight * 0.015));
    }

    return widgets;
  }
}
