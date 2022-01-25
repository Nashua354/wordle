import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({Key? key, this.color, this.alphabet}) : super(key: key);
  final String? alphabet;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: boundary),
          color: (alphabet ?? '').isEmpty ? Colors.transparent : color),
      child: Center(
        child: Text(
          (alphabet ?? '').toUpperCase(),
          style: const TextStyle(color: white),
        ),
      ),
    );
  }
}
