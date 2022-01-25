import 'package:flutter/material.dart';
import 'package:wordle/widgets/textbox.dart';

class WordBox extends StatelessWidget {
  WordBox({Key? key, this.colors, this.word}) : super(key: key);
  List<String>? word;
  List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextBoxWidget(
          alphabet: word![0],
          color: colors?[0],
        ),
        TextBoxWidget(
          alphabet: word![1],
          color: colors?[1],
        ),
        TextBoxWidget(
          alphabet: word![2],
          color: colors?[2],
        ),
        TextBoxWidget(
          alphabet: word![3],
          color: colors?[3],
        ),
        TextBoxWidget(
          alphabet: word![4],
          color: colors?[4],
        )
      ],
    );
  }
}
