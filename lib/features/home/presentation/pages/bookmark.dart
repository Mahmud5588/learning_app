import 'package:flutter/material.dart';
import 'package:learnig_app/features/home/presentation/widget/category_field.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool isSelect = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmarks",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune_outlined)),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              CategoryField(
                label: "🔥All",
                iconColor: isSelect ? Colors.blue : Colors.black,
                onTap: () {
                  setState(() {
                    isSelect = !isSelect;
                  });
                },
                boxColor: isSelect ? Colors.white : Colors.blue,
              ),
              CategoryField(
                label: "💡3D Design",
                iconColor: !isSelect ? Colors.blue : Colors.black,
                onTap: () {
                  setState(() {
                    isSelect = !isSelect;
                  });
                },
                boxColor: !isSelect ? Colors.white : Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
