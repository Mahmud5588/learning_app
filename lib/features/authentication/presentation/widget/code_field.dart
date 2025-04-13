import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeField extends StatelessWidget {
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final bool? obscureCode;

  const CodeField({
    required this.currentNode,
    this.nextNode,
    this.obscureCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
        focusNode: currentNode,
        obscureText: obscureCode ?? false,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
      ),
    );
  }
}
