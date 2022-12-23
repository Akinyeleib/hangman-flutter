import 'package:flutter/material.dart';

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

// Assign colors to letters
Map bgColor = {for (var l in alphabets) l.toUpperCase(): defaultColor};

// Future<List<String>> countries = getData();

// // Future<List<String>> getData() async {
// //   String response =
// //       await rootBundle.loadString('assets/textfiles/countries.txt');
// //   print(response.split('\n'));
// //   return response.split('\n');
// }

class KeyLetter extends StatelessWidget {
  String letter;
  KeyLetter(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      decoration: BoxDecoration(
        color: bgColor[letter],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        letter,
        style: const TextStyle(
          color: letterColor,
          fontWeight: FontWeight.bold,
          fontSize: 40,
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
      padding: const EdgeInsets.all(20),
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
