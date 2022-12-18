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

class HangMan extends StatefulWidget {
  @override
  State<HangMan> createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  String country = countries[Random().nextInt(countries.length)].toUpperCase();
  String dashes = "", clicked = "";
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
              TextContainer(dashes),
              // Keyboard
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: generate,
        //   child: const Icon(Icons.edit_notifications),
        // ),
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
    print("Letter is: $letter");
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
    return Text(
      letter,
      style: const TextStyle(
        backgroundColor: Colors.black,
        color: Colors.amber,
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
      ),
    );
  }
}
