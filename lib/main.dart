import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(HangMan());

List<String> countries = [
  "Nigeria",
  "Niger",
  "Chad",
  "Portugal",
  "France",
  "Argentina"
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
          margin: const EdgeInsets.all(10),
          color: Colors.lightBlue,
          padding: const EdgeInsets.all(2),
          child: Text(
            country,
            style: const TextStyle(letterSpacing: 15),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: generate,
          
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
