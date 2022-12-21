import 'dart:io';
import 'dart:math';
import 'helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() => runApp(HangMan());

class HangMan extends StatefulWidget {
  @override
  State<HangMan> createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  int score = 0, wrongAttempts = 0, wrongAttemptLimit = 5;
  late String country, dashes, clicked;
  // Assign colors to letters
  Map bgColor = {for (var l in alphabets) l.toUpperCase(): defaultColor};
  List<String> countries = ["Nigeria"];

  @override
  void initState() {
    super.initState();
    generate();
    clicked = "";
    dashes = "";
    readCountries();
  }

  void readCountries() {
    File file = File("assets/textfiles/countries.txt");
    countries = file.readAsLinesSync();
    // print(countries);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: the_color),
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
                    Holder("Score", score),
                  ],
                ),
              ),
              // TextContainer(country),
              TextContainer(dashes == "" ? generateDashes() : dashes),
              // Container(
              //   alig2335nment: Alignment.center,
              //   child: Row(
              //     children: <Widget>[
              //       for (String l in dashes.split("")) KeyLetter(l)
              //     ],
              //   ),
              // ),
              // Keyboard
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(25),
                ),
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
    wrongLetters.clear();
    rightLetters.clear();
    setState(
      () {
        int range = countries.length;
        int rd = Random().nextInt(range);
        country = countries[rd].toUpperCase();
        dashes = generateDashes();
      },
    );
    countries.remove(country);
  }

  void check(String letter) {
    if (wrongLetters.contains(letter) || rightLetters.contains(letter)) return;

    String res = "";
    dashes = dashes == "" ? generateDashes() : dashes;

    if (!country.contains(letter)) {
      wrongLetters.add(letter);

      if (wrongLetters.length > wrongAttemptLimit) {
        setState(
          () {
            restartGame();
          },
        );
      }
      return;
    }
    rightLetters.add(letter);

    setState(
      () {
        if (country.contains(letter)) {
          for (var i = 0; i < country.length; i++) {
            if (letter == country[i]) {
              res += letter;
              score += 2;
            } else {
              res += dashes[i];
            }
          }
        }
        dashes = res;

        if (dashes == country)
          Future.delayed(const Duration(seconds: 1), generate);
      },
    );
  }

  String generateDashes() {
    String dash = "";
    for (int i = 0; i < country.length; i++) {
      if (country[i] == " ")
        dash += " ";
      else
        dash += "-";
    }
    return dash;
  }

  getData() async {
    String response =
        await rootBundle.loadString('assets/textfiles/countries.txt');
    print(response.split('\n'));
  }

  void restartGame() {
    wrongAttempts = 0;
    wrongLetters.clear();
    rightLetters.clear();
    setState(
      () {
        score = 0;
        generate();
      },
    );
  }
}
