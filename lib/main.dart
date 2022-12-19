import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(HangMan());

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

Color defaultColor = Colors.amber;
Color rightColor = Colors.green;
Color wrongColor = Colors.red;

// generate Alphabets
List<String> alphabets =
    List.generate(26, (index) => String.fromCharCode(index + 65));

class HangMan extends StatefulWidget {
  @override
  State<HangMan> createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  String country = countries[Random().nextInt(countries.length)].toUpperCase();
  String dashes = "", clicked = "";
  Map bgColor = {for (var l in alphabets) l: defaultColor};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "HangMan",
            // style: TextStyle(letterSpacing: 15),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Holder("High Score", 00),
                    Holder("Time", 00),
                    Holder("Score", 00),
                  ],
                ),
              ),
              TextContainer(country),
              TextContainer(dashes == "" ? generateDashes() : dashes),
              // Keyboard
              Container(
                color: Colors.black,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First row
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              check("Q");
                            },
                            child: KeyLetter("Q"),
                          ),
                          InkWell(
                            onTap: () {
                              check("W");
                            },
                            child: KeyLetter("W"),
                          ),
                          InkWell(
                            onTap: () {
                              check("E");
                            },
                            child: KeyLetter("E"),
                          ),
                          InkWell(
                            onTap: () {
                              check("R");
                            },
                            child: KeyLetter("R"),
                          ),
                          InkWell(
                            onTap: () {
                              check("T");
                            },
                            child: KeyLetter("T"),
                          ),
                          InkWell(
                            onTap: () {
                              check("Y");
                            },
                            child: KeyLetter("Y"),
                          ),
                          InkWell(
                            onTap: () {
                              check("U");
                            },
                            child: KeyLetter("U"),
                          ),
                          InkWell(
                            onTap: () {
                              check("I");
                            },
                            child: KeyLetter("I"),
                          ),
                          InkWell(
                            onTap: () {
                              check("O");
                            },
                            child: KeyLetter("O"),
                          ),
                          InkWell(
                            onTap: () {
                              check("P");
                            },
                            child: KeyLetter("P"),
                          ),
                        ],
                      ),
                    ),
                    // Second row
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              check("A");
                            },
                            child: KeyLetter("A"),
                          ),
                          InkWell(
                            onTap: () {
                              check("S");
                            },
                            child: KeyLetter("S"),
                          ),
                          InkWell(
                            onTap: () {
                              check("D");
                            },
                            child: KeyLetter("D"),
                          ),
                          InkWell(
                            onTap: () {
                              check("F");
                            },
                            child: KeyLetter("F"),
                          ),
                          InkWell(
                            onTap: () {
                              check("G");
                            },
                            child: KeyLetter("G"),
                          ),
                          InkWell(
                            onTap: () {
                              check("H");
                            },
                            child: KeyLetter("H"),
                          ),
                          InkWell(
                            onTap: () {
                              check("J");
                            },
                            child: KeyLetter("J"),
                          ),
                          InkWell(
                            onTap: () {
                              check("K");
                            },
                            child: KeyLetter("K"),
                          ),
                          InkWell(
                            onTap: () {
                              check("L");
                            },
                            child: KeyLetter("L"),
                          ),
                        ],
                      ),
                    ),
                    // Third row
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              check("Z");
                            },
                            child: KeyLetter("Z"),
                          ),
                          InkWell(
                            onTap: () {
                              check("X");
                            },
                            child: KeyLetter("X"),
                          ),
                          InkWell(
                            onTap: () {
                              check("C");
                            },
                            child: KeyLetter("C"),
                          ),
                          InkWell(
                            onTap: () {
                              check("V");
                            },
                            child: KeyLetter("V"),
                          ),
                          InkWell(
                            onTap: () {
                              check("B");
                            },
                            child: KeyLetter("B"),
                          ),
                          InkWell(
                            onTap: () {
                              check("N");
                            },
                            child: KeyLetter("N"),
                          ),
                          InkWell(
                            onTap: () {
                              check("M");
                            },
                            child: KeyLetter("M"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generate() {
    setState(() {
      country = countries[Random().nextInt(countries.length)].toUpperCase();
      dashes = generateDashes();
    });
  }

  void check(String letter) {
    String res = "";
    dashes = dashes == "" ? generateDashes() : dashes;

    setState(
      () {
        if (country.contains(letter)) {
          for (var i = 0; i < country.length; i++) {
            if (letter == country[i]) {
              res += letter;
            } else
              res += dashes[i];
          }
        }
        dashes = res;

        print("Dashed is: $dashes");

        if (dashes == country) generate();
      },
    );

    // generate();
  }

  String generateDashes() {
    String dash = "";
    for (int i = 0; i < country.length; i++) {
      dash += "-";
    }
    return dash;
  }
}

class KeyLetter extends StatelessWidget {
  String letter;
  KeyLetter(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
      color: Colors.amber,
      child: Text(
        letter,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
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
        Text(label),
        Text("$value"),
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
      color: Colors.lightBlue,
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
