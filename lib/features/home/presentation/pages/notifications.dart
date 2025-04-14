import 'package:flutter/material.dart';
import 'package:learnig_app/features/home/presentation/widget/notifications_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.tune_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),

              Text(
                "Today",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(height: screenHeight * 0.02),
              NotificationsWidget(
                image: "assets/images/notification_payment.png",
                title: "Payment Successful",
                subtitle: "You have made of course payment",
              ),
              SizedBox(height: screenHeight * 0.02),
              NotificationsWidget(
                image: "assets/images/notifications_prize.png",
                title: "Today's special offers",
                subtitle: "You get a special promo today",
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Yesterday",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(height: screenHeight * 0.02),
              NotificationsWidget(
                image: "assets/images/notifications_category.png",
                title: "New Category Courses",
                subtitle: "You have made of course have",
              ),
              SizedBox(height: screenHeight * 0.02),

              NotificationsWidget(
                image: "assets/images/notifications_icon.png",
                title: "Credit Card Connected",
                subtitle: "You have made of course have",
              ),
              Text(
                "December",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(height: screenHeight * 0.02),

              NotificationsWidget(
                image: "assets/images/notifications_account.png",
                title: "Account Setup successfully",
                subtitle: "You have made of course have",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
