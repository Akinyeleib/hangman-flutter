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
  String dashes = "";
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First row
                    Row(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: generate,
          child: const Icon(Icons.edit_notifications),
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

  String generateDashes() {
    String dash = "";
    for (int i = 0; i < country.length; i++) {
      dash += "-";
    }
    return dash;
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
