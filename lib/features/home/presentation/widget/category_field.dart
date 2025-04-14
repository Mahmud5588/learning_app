import 'package:flutter/material.dart';

class CategoryField extends StatelessWidget {
  final String label;
  final Color boxColor;
  final VoidCallback onTap;
  final Color iconColor;

  const CategoryField({
    super.key,
    required this.label,
    required this.iconColor,
    required this.onTap,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
