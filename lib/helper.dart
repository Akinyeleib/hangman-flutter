import 'package:flutter/material.dart';

List<String> countries = [
  "Nigeria",
  "Niger",
  "Chad",
  "Portugal",
  "France",
  "Argentina",
  "China",
  "Japan",
  "Croatia",
  "Belgium"
];

List<String> wrongLetters = [];
List<String> rightLetters = [];

MaterialColor the_color = Colors.purple;
Color defaultColor = Color.fromARGB(63, 240, 231, 240);
Color rightColor = Colors.green;
Color wrongColor = Colors.red;
Color boardColor = the_color;
const Color letterColor = Colors.black;

TextStyle keyStyle = const TextStyle(
  fontSize: 25,
);

// generate Alphabets
List<String> alphabets =
    List.generate(26, (index) => String.fromCharCode(index + 65));

class KeyLetter extends StatelessWidget {
  String letter;
  KeyLetter(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
      decoration: BoxDecoration(
        color: defaultColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        letter,
        style: const TextStyle(
          color: letterColor,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
    );
  }
}

class Holder extends StatelessWidget {
  String label;
  int value;
  Holder(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: keyStyle,
        ),
        Text(
          "$value",
          style: keyStyle,
        ),
      ],
    );
  }
}

class TextContainer extends StatelessWidget {
  String text;
  TextContainer(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: boardColor,
      padding: const EdgeInsets.all(2),
      child: Text(
        text,
        style: const TextStyle(
          letterSpacing: 15,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
