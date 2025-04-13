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
          leading: Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "asset/images/avatar.png",
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Good Morning 👋",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("Andrew Ansley",style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,),),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Center(child: Column(children: [])),
      ),
    );
  }
}
