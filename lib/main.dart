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
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          color: Colors.lightBlue,
          padding: const EdgeInsets.all(2),
          child: Text(
            country,
            style: const TextStyle(
              letterSpacing: 15,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
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
    });
  }
}
