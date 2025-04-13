import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  const OnBoardingWidget({
    required this.title,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 150),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor() {
    if (imagePath.contains('illustration1')) {
      return Colors.pink;
    } else if (imagePath.contains('illustration2')) {
      return Colors.transparent;
    } else {
      return Colors.white;
    }
  }
}
