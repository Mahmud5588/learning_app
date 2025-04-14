import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(backgroundColor: Colors.blue),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_outlined),
            ),
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning 👋",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                "Andrew Ansley",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.tune_sharp),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200]!),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Today",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
