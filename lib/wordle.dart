import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/widgets/keyboard.dart';
import 'package:wordle/widgets/textboxes.dart';

class Wordle extends StatefulWidget {
  const Wordle({Key? key}) : super(key: key);

  @override
  _WordleState createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  int level = 0;

  List<List<String>> finalWords = [
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', '']
  ];
  List<List<Color>> colors = [
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ],
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ],
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ],
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ],
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ],
    [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ]
  ];
  List<String> bannedAlphabets = [];
  String answerWord = words[0];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: const Text('WORDLE'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ...List.generate(
                6,
                (index) => WordBox(
                    colors: colors[index],
                    word: (index == level)
                        ? finalWords[level]
                        : finalWords[index])),
            Expanded(child: Container()),
            if (level == 7)
              const Text(
                'You Win',
                style: TextStyle(color: white, fontSize: 30),
              ),
            if (level == 6)
              Text(
                'You Loose. \nAnswer = ${answerWord.toUpperCase()}',
                style: const TextStyle(color: white, fontSize: 30),
              ),
            // Text('Try Another Word', style: TextStyle(color: white)),
            if (level < 6)
              KeyboardWidget(
                bannedAlphabets: bannedAlphabets,
                onTap: (String alphabet) async {
                  onEnter(alphabet);
                },
              )
          ],
        ),
      ),
    );
  }

  void onEnter(String alphabet) {
    switch (alphabet) {
      case 'Enter':
        if (finalWords[level].contains('')) {
          showDialogBox('Not enough Letters');
        } else if (finalWords[level].join() == answerWord) {
          colors[level] = [green, green, green, green, green];
          level = 7;
          setState(() {});
        } else if (!words.contains(finalWords[level].join())) {
          showDialogBox('Not in Word List');
        } else {
          for (var i = 0; i < finalWords[level].length; i++) {
            if (answerWord.contains(finalWords[level][i])) {
              if (answerWord.indexOf(finalWords[level][i]) == i) {
                colors[level][i] = green;
              } else {
                colors[level][i] = yellow;
              }
            } else {
              bannedAlphabets.add(finalWords[level][i]);
              colors[level][i] = grey;
            }
          }

          level++;
          setState(() {});
        }
        break;
      default:
        updateValue(alphabet);
        setState(() {});
    }
  }

  Future<void> showDialogBox(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: grey,
          // title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  message,
                  style: const TextStyle(color: white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void updateValue(String alphabet) {
    if (alphabet == 'Clear') {
      for (var i = finalWords[level].length - 1; i >= 0; i--) {
        if (finalWords[level][i] != '') {
          finalWords[level][i] = '';
          break;
        }
      }
    } else {
      for (var i = 0; i < finalWords[level].length; i++) {
        if (finalWords[level][i] == '') {
          finalWords[level][i] = alphabet;
          break;
        }
      }
    }
  }
}
