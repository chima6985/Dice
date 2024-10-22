// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Center(child: Text("DICE")),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  bool showCongratulations = false;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if (leftDiceNumber == 6 && rightDiceNumber == 6) {
        showCongratulations = true;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            showCongratulations = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/dice$leftDiceNumber.png"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/dice$rightDiceNumber.png"),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade900,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text('Roll Dice'),
            ),
          ],
        ),
        if (showCongratulations)
          Center(
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}



// need to learn authentication for this app and also to score keep