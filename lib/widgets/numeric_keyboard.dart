import 'package:flutter/material.dart';
import 'package:wordle/constants/alphabets.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/widgets/keyboard.dart';

class NumericKeyboardWidget extends StatelessWidget {
  const NumericKeyboardWidget({Key? key, this.bannedAlphabets, this.onTap})
      : super(key: key);
  final Function(String)? onTap;
  final List<String>? bannedAlphabets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numbers1.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(numbers1[index]),
              onTap: onTap,
              alphabet: numbers1[index],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numbers2.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(numbers2[index]),
              onTap: onTap,
              alphabet: numbers2[index],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numbers3.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(numbers3[index]),
              onTap: onTap,
              alphabet: numbers3[index],
            ),
          ),
        ),
      ],
    );
  }
}
