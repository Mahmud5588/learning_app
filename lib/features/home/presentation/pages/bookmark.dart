import 'package:flutter/material.dart';
import 'package:learnig_app/features/home/presentation/widget/category_field.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool isSelect = true;

  // Bookmark list
  List<Map<String, String>> bookmarkList = [
    {
      "title": "3D Characters Illustration",
      "price": "\$52",
      "oldPrice": "\$88",
      "students": "12,736 students",
      "category": "3D Design",
      "image": "assets/images/boookmark1.png",
    },
    {
      "title": "Full-Stack Web Development",
      "price": "\$48",
      "oldPrice": "\$70",
      "students": "11,272 students",
      "category": "Programming",
      "image": "assets/images/boookmark1.png",
    },
    {
      "title": "Flutter Mobile Apps",
      "price": "\$44",
      "oldPrice": "\$72",
      "students": "9,928 students",
      "category": "Programming",
      "image": "assets/images/boookmark1.png",
    },
    {
      "title": "Wordpress Website Design",
      "price": "\$46",
      "oldPrice": "\$66",
      "students": "10,298 students",
      "category": "Technology",
      "image": "assets/images/boookmark1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookmark",
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.black)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                CategoryField(
                  label: "🔥 All",
                  iconColor: isSelect ? Colors.white : Colors.blue,
                  boxColor: isSelect ? Colors.blue : Colors.white,
                  onTap: () {
                    setState(() {
                      isSelect = true;
                    });
                  },
                ),
                SizedBox(width: 8),
                CategoryField(
                  label: "💡 3D Design",
                  iconColor: !isSelect ? Colors.white : Colors.blue,
                  boxColor: !isSelect ? Colors.blue : Colors.white,
                  onTap: () {
                    setState(() {
                      isSelect = false;
                    });
                  },
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              itemCount: bookmarkList.length,
              itemBuilder: (context, index) {
                var item = bookmarkList[index];
                return GestureDetector(
                  onTap: () {
                    showRemoveDialog(context, item, index);
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item["image"]!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item["title"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Text(item["price"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          SizedBox(width: 5),
                          Text(
                            item["oldPrice"]!,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.bookmark, color: Colors.blue),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showRemoveDialog(BuildContext context, Map<String, String> item, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Remove from Bookmark?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.asset(
                item["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                item["title"]!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(item["price"]!),
              trailing: const Icon(Icons.bookmark, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        bookmarkList.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Yes, Remove"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
