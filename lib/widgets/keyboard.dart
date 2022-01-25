import 'package:flutter/material.dart';
import 'package:wordle/constants/alphabets.dart';
import 'package:wordle/constants/colors.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({Key? key, this.bannedAlphabets, this.onTap})
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
            firstLine.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(firstLine[index]),
              onTap: onTap,
              alphabet: firstLine[index],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            secondLine.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(secondLine[index]),
              onTap: onTap,
              alphabet: secondLine[index],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            thirdLine.length,
            (index) => KeyWidget(
              isEnabled: (bannedAlphabets ?? []).contains(thirdLine[index]),
              onTap: onTap,
              alphabet: thirdLine[index],
            ),
          ),
        )
      ],
    );
  }
}

class KeyWidget extends StatelessWidget {
  const KeyWidget(
      {Key? key, this.isEnabled, required this.onTap, required this.alphabet})
      : super(key: key);
  final String? alphabet;
  final Function(String)? onTap;
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (!(isEnabled ?? true)) {
        onTap!(alphabet ?? '');
        // }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 1),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: boundary),
            color: isEnabled ?? true ? grey : activeGrey),
        child: Text(
          (alphabet ?? '').toUpperCase(),
          style: const TextStyle(color: white),
        ),
      ),
    );
  }
}
